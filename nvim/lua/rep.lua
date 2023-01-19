local uv = vim.loop
local api = vim.api

require "utils"

local function search_marker_text(startl, endl)

    local selection = api.nvim_buf_get_text(0, startl, 0, endl, -1, {})

    local output_line = -1
    local read = false

    local text_input = {}

    for k, v in pairs(selection) do

        if v == "===" then
            read = false
            output_line = startl + k
            break
        end

        if read then
            table.insert(text_input, v)
        end

        if v == ">>>" then
            read = true
        end

    end

    return text_input, output_line
end

local function rep(fn, args, sep)

    if args == nil then
        args = {}
    end

    if sep == nil then
        sep = "\n"
    end

    local startl = api.nvim_buf_get_mark(0, "<")[1] - 1
    local endl = api.nvim_buf_get_mark(0, ">")[1] - 1

    local text_input, output_line = search_marker_text(startl, endl)

    if #text_input == 0 or output_line == -1 then
        text_input, output_line = search_marker_text(0, vim.api.nvim_buf_line_count(0) - 1)
    end

    if #text_input == 0 or output_line == -1 then
        print("ERROR: No text, start (>>>) or end (===) token found")
        return
    end

    local text = table.concat(text_input, sep)

    local acb
    acb = uv.new_async(vim.schedule_wrap(function(res)
        local lines = {}
        for s in res:gmatch("[^\r\n]+") do
            table.insert(lines, s)
        end
        table.insert(lines, "<<<")
        vim.api.nvim_buf_set_lines(0, output_line, output_line, true, lines)
        acb:close()
    end))

    uv.new_thread(fn, text, acb, unpack(args))

end

return rep
