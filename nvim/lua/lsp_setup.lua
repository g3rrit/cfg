local lspconfig = require("lspconfig")
local api = vim.api

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Set default border
require('lspconfig.ui.windows').default_options.border = "rounded"

local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

-- change boarders
vim.diagnostic.config {
    float = { border = "rounded" },
}

-- lua
-- TODO: This seems to be broken at the moment
-- lspconfig.lua_lsp.setup({
--     -- on_attach = custom_command,
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = "LuaJIT",
--                 -- Setup your lua path
--                 path = runtime_path,
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { "vim" },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- 
--     capabilities = cmp_capabilities
-- })

-- haskell
lspconfig.hls.setup({
    capabilities = cmp_capabilities
})

-- ocaml
lspconfig.ocamllsp.setup({
    capabilities = cmp_capabilities
})

-- c/c++
lspconfig.ccls.setup({
    init_options = {
        compilationDatabaseDirectory = "build",
    }
})

-- java
lspconfig.jdtls.setup({})

-- javascript

lspconfig.denols.setup({})

-- Python
lspconfig.pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {},
                    maxLineLength = 120
                }
            }
        }
    }
})

-- Scala

-- We don't use lspconfig but the nvim-metals plugin instead.
-- An example configuration can be found here: https://github.com/scalameta/nvim-metals/discussions/39
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
    showImplicitArguments = true,
    excludedPackages = {
        "akka.actor.typed.javadsl",
        "com.github.swagger.akka.javadsl",
    },
    scalafmtConfigPath = "/usr/local/cfg/nvim/config/scalafmt.conf",
}

metals_config.capabilities = cmp_capabilities

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
    -- NOTE: You may or may not want java included here. You will need it if you
    -- want basic Java support but it may also conflict if you are using
    -- something like nvim-jdtls which also works on a java filetype autocmd.
    pattern = { "scala", "sbt", "java" },
    callback = function()
        print("Intializing metals")
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})
