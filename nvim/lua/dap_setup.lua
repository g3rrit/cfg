local dapui = require("dapui")
local dap = require("dap")

------------------------------------------------------------------------------------------------------------------------
-- UI
------------------------------------------------------------------------------------------------------------------------

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

------------------------------------------------------------------------------------------------------------------------
-- PROJECT CONFIG
-- Reference: https://github.com/ldelossa/nvim-dap-projects/blob/main/lua/nvim-dap-projects.lua
------------------------------------------------------------------------------------------------------------------------

local function search_project_config()

    local project_dir = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";") .. "/"
    local config_paths = { ".dap.lua" }
    local project_config = ""

    for _, p in ipairs(config_paths) do
        p = project_dir .. p
        vim.notify("[nvim-dap] " .. p, vim.log.levels.ERROR, nil)
        local f = io.open(p)
        if f ~= nil then
            f:close()
            project_config = p
            break
        end
    end

    if project_config == "" then
        vim.notify("[nvim-dap] did not found config file", vim.log.levels.ERROR, nil)
        return
    end

    vim.notify("[nvim-dap] Found nvim-dap configuration at." .. project_config, vim.log.levels.INFO, nil)

    require("dap").adapters = (function() return {} end)()
    require("dap").configurations = (function() return {} end)()
    vim.cmd(":luafile " .. project_config)
end

vim.api.nvim_create_user_command(
    "SearchProjectConfig",
    function(opts)
        search_project_config()
    end,
    { nargs = 0, force = true }
)

------------------------------------------------------------------------------------------------------------------------
-- ADAPTERS
------------------------------------------------------------------------------------------------------------------------

dap.adapters.lldb = {
    type = "executable",
    command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- adjust as needed, must be absolute path
    name = "lldb"
}

------------------------------------------------------------------------------------------------------------------------
-- CONFIG
------------------------------------------------------------------------------------------------------------------------

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},

        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
        env = function()
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
                table.insert(variables, string.format("%s=%s", k, v))
            end
            return variables
        end,
    },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
