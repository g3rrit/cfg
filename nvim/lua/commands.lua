local utils = require "utils"
local rep = require "rep"
local rep_cmds = require "rep_cmds"

-- Completion Functions
-- currently there seems to be no easy way to define the completion functions in lua
vim.api.nvim_exec([[

function! CompleteOpenF(al, cl, cp)
    let args = [ "virc", "vimd", "zshrc", "bashrc" ]
    return join(args, "\n")
endfunction

]], false)
--


vim.api.nvim_create_user_command(
    'ExecCmd',
    function(opts)
        local cmd = opts.fargs[1]
        local args = utils.slice(opts.fargs, 2)
        utils.exec_cmd(false, cmd, args)
    end,
    { nargs = "+", force = true }
)

vim.api.nvim_create_user_command(
    'ExecCmdD',
    function(opts)
        local cmd = opts.fargs[1]
        local args = utils.slice(opts.fargs, 2)
        utils.exec_cmd(true, cmd, args)
    end,
    { nargs = "+", force = true }
)

vim.api.nvim_create_user_command(
    'TestBufRep',
    function(_)
        rep.rep(function(text)
            text = string.gsub(text, "\n", " ")
            return { text }
        end)
    end,
    { nargs = 0, force = true }
)

vim.api.nvim_create_user_command(
    'ChatGPT',
    function(opts)
        rep_cmds.chat_rep(opts.fargs)
    end,
    { nargs = "*", force = true }
)

vim.api.nvim_create_user_command(
    'Trans',
    function(opts)
        rep_cmds.trans_rep(opts.fargs)
    end,
    { nargs = "*", force = true }
)

vim.api.nvim_create_user_command(
    'TransW',
    function(opts)
        local word, src, dst = unpack(opts.fargs)
        if src == nil then
            src = "no"
        end
        if dst == nil then
            dst = "en"
        end
        local res_stdout, _, code = utils.run_sync(
            "trans", { "-b", "-s", src, "-t", dst, word }
        )
        if code ~= 0 then
            print("ERROR: executing trans")
        else
            print(res_stdout)
        end
    end,
    { nargs = "+", force = true }
)

function COMPLETE_OPENF(arg_lead, cmd_line, cursor_pos)
                return "foo"
                -- return table.concat({ "foo", "bar" }, "\n")
end


vim.api.nvim_create_user_command(
    "OpenF",
    function(opts)
        local arg = opts.fargs[1]
        local f = nil

        if arg == "virc" then
            f = "~/.config/nvim/init.lua"
        end
        if arg == "vimd" then
            f = "~/.config/nvim/Readme.md"
        end
        if arg == "zshrc" then
            f = "~/.zshrc"
        end
        if arg == "bashrc" then
            f = "~/.bashrc"
        end

        if f == nil then
            print("Invalid argument", arg)
        else
            vim.cmd("tabnew " .. f)
        end

    end,
    {
        nargs = 1,
        force = true,
        complete = "custom,CompleteOpenF"
    }
)

-- DEBUG

vim.api.nvim_create_user_command(
    'ReloadLua',
    function()
        for k in pairs(package.loaded) do
            if (
                k:match("^utils") or
                k:match("^commands") or
                k:match("^keybindings") or
                k:match("^rep") or
                k:match("^rep_cmds") or
                k:match("^auto_cmds") or
                k:match("^chat")
            ) then
                package.loaded[k] = nil
            end
        end
        require("utils")
        require("keybindings")
        require("commands")
        require("rep")
        require("rep_cmds")
        require("auto_cmds")
        require("chat")
    end,
    { nargs = 0, force = true }
)

