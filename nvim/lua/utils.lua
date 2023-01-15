local loop = vim.loop
local api = vim.api

local M = {}

function M.make_scratch()
    api.nvim_command('enew')
    vim.bo[0].buftype = nofile
    vim.bo[0].bufhidden = hide
    vim.bo[0].swapfile = false
end

function string:split(delimiter)
    local result               = {}
    local from                 = 1
    local delim_from, delim_to = string.find(self, delimiter, from)
    while delim_from do
        table.insert(result, string.sub(self, from, delim_from - 1))
        from                 = delim_to + 1
        delim_from, delim_to = string.find(self, delimiter, from)
    end
    table.insert(result, string.sub(self, from))
    return result
end

function M.slice(tbl, first, last, step)
    local sliced = {}

    for i = first or 1, last or #tbl, step or 1 do
        sliced[#sliced + 1] = tbl[i]
    end

    return sliced
end

--- Create a popup window.
-- @param kill_on_done Flag indicating whether to kill the command and buffer when the popup is closed.
-- @param cmd Command or executable.
-- @param opt_args Additional arguments for command.
function M.exec_cmd(kill_on_done, cmd, opt_args)

    local win_height = api.nvim_get_option("lines")
    local win_width = api.nvim_get_option("columns")

    local width = math.floor(win_width / 1.5)
    local height = math.floor(win_height / 1.5)

    local xpos = math.floor(win_width / 2 - width / 2)
    local ypos = math.floor(win_height / 2 - height / 2)

    -- Create the scratch buffer displayed in the floating window
    local buf = api.nvim_create_buf(true, true)

    -- Set mappings in the buffer to close the window easily
    local close_string = ""
    if kill_on_done then
        close_string = string.format(":%dbw<CR>", buf)
    else
        close_string = ":close<CR>"
    end
    api.nvim_buf_set_keymap(
        buf,
        'n',
        "<ESC>",
        close_string,
        {
            silent = true,
            nowait = true,
            noremap = true
        }
    )

    -- Create the floating window
    local win = api.nvim_open_win(
        buf,
        true,
        {
            relative = "editor",
            row = ypos,
            col = xpos,
            width = width,
            height = height,
            border = "rounded",
            style = "minimal"
        }
    )
    api.nvim_win_set_option(win, "winhl", "Normal:")

    local line_num = 0

    local stdout = loop.new_pipe(false)
    local stderr = loop.new_pipe(false)

    local function onread(err, data)
        if err then
            print('ERROR: ' .. err)
        end
        if data then
            local vals = vim.split(data, "\n")
            for _, d in pairs(vals) do
                if d == "" then goto continue end

                vim.schedule(function()
                    api.nvim_buf_set_lines(buf, line_num, line_num + 1, false, { d })
                    line_num = line_num + 1
                end)

                ::continue::
            end
        end
    end

    -- convert vaargs to array
    -- local opt_args={...}

    local handle = nil

    local function remove_process(kill)
        if not stdout:is_closing() then
            stdout:read_stop()
            stdout:close()
        end
        if not stderr:is_closing() then
            stderr:read_stop()
            stderr:close()
        end

        if not handle:is_closing() then
            if kill then
                print("Killed: " .. cmd)
                handle:kill()
            else
                handle:close()
            end
        end
    end

    -- :<buf>bw[ipeout] to kill buffer
    vim.api.nvim_buf_attach(buf, false, {
        on_detach = function()
            remove_process(true)
        end
    })

    handle = loop.spawn(
        cmd,
        {
            args = opt_args,
            stdio = { nil, stdout, stderr }
        },
        vim.schedule_wrap(function()
            remove_process(false)
        end
        )
    )
    loop.read_start(stdout, onread)
    loop.read_start(stderr, onread)

    local pid = handle:get_pid()
    api.nvim_buf_set_name(buf, string.format("[Command](%d) :: %s", pid, cmd))

end

return M
