-- Set leader key
vim.keymap.set("n", "<space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = "<space>"

default_opts = {
    remap = false,
    silent = true
}

-- Move up/down editor lines
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "k", "gk", default_opts)

-- These movement keybindings are set by the tmux navigator plugin
-- vim.keymap.set("n", "<C-h>", "<C-w>h", default_opts)
-- vim.keymap.set("n", "<C-j>", "<C-w>j", default_opts)
-- vim.keymap.set("n", "<C-k>", "<C-w>k", default_opts)
-- vim.keymap.set("n", "<C-l>", "<C-w>l", default_opts)

-- Searching
vim.keymap.set("n", "/", "/\\v", default_opts)
vim.keymap.set("n", "<space><space>", ":let @/=''<cr>", default_opts) -- clear search

-- Formatting
vim.keymap.set("n", "<space>q", "gqip", default_opts) -- clear search

-- Splits
vim.keymap.set("n", "<space>v", ":vsplit<CR>", default_opts)
vim.keymap.set("n", "<space>\"", ":split<CR>", default_opts)

-- Save
vim.keymap.set("n", "<space>s", ":w<CR>", default_opts)

-- Close current window
vim.keymap.set("n", "<space>x", "<C-w>c", default_opts)

-- Tabs
vim.keymap.set("n", "<space>t", ":tabnew<CR>", default_opts)

-- FZF Settings
vim.keymap.set("n", "<space>p", ":Files<CR>", default_opts)
vim.keymap.set("n", "<space>f", ":Ag<CR>", default_opts)
vim.keymap.set("n", "<space>b", ":Buffer<CR>", default_opts)

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        opts = {
            buffer = args.buf,
            remap = false,
            silent = true
        }

        local function keymap_set(mapping, action, check)
            -- if check then
                vim.keymap.set('n', mapping, action, opts)
            -- end
        end

        keymap_set('gh', vim.lsp.buf.hover, client.server_capabilities.hoverProvider)
        keymap_set('<space>r', vim.lsp.buf.rename, client.server_capabilities.renameProvider)
        keymap_set('gD',vim.lsp.buf.declaration, client.server_capabilities.declarationProvider)
        keymap_set('gd',vim.lsp.buf.definition, client.server_capabilities.definitionProvider)
        keymap_set('gr',vim.lsp.buf.references, client.server_capabilities.referencesProvider)
        keymap_set('gs',vim.lsp.buf.signature_help, client.server_capabilities.signature_helpProvider)
        keymap_set('gi',vim.lsp.buf.implementation, client.server_capabilities.implementationProvider)
        -- TODO: find something better here
        -- keymap_set('gt',vim.lsp.buf.type_definition, client.server_capabilities.type_definitionProvider)
        keymap_set('<space>gw',vim.lsp.buf.document_symbol, client.server_capabilities.document_symbolProvider)
        keymap_set('<space>gW',vim.lsp.buf.workspace_symbol, client.server_capabilities.workspace_symbolProvider)
        keymap_set('<space>ah',vim.lsp.buf.hover, client.server_capabilities.hoverProvider)
        keymap_set('<space>af',vim.lsp.buf.code_action, client.server_capabilities.code_actionProvider)
        -- TODO: fix this
        -- keymap_set('<space>ee',vim.lsp.util.show_line_diagnostics, client.server_capabilities.show_line_diagnosticsProvider)
        keymap_set('<space>ar',vim.lsp.buf.rename, client.server_capabilities.renameProvider)
        keymap_set('<space>=', vim.lsp.buf.format, client.server_capabilities.formatProvider)
        keymap_set('<space>ai',vim.lsp.buf.incoming_calls, client.server_capabilities.incoming_callsProvider)
        keymap_set('<space>ao',vim.lsp.buf.outgoing_calls, client.server_capabilities.outgoing_callsProvider)
    end,
})

-- Easymotion
vim.keymap.set("n", '<space>', '<Plug>(easymotion-prefix)', default_opts)

-- Nerdtree
vim.keymap.set("n", '<space>n', ':NERDTreeTabsToggle<CR>', default_opts)
