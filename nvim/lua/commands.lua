local utils = require "utils"

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

-- DEBUG

vim.api.nvim_create_user_command(
    'ReloadLua',
    function()
        for k in pairs(package.loaded) do
            if k:match("^utils") or k:match("^commands") or k:match("^keybindings") then
                package.loaded[k] = nil
            end
        end
        require("utils")
        require("keybindings")
        require("commands")
    end,
    { nargs = 0, force = true }
)

