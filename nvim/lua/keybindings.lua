-- Move up/down editor lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

-- These movement keybindings are set by the tmux navigator plugin
-- vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Searching
vim.api.nvim_set_keymap("n", "/", "/\\v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "/", "/\\v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space><space>", ":let @/=''<cr>", { noremap = true, silent = true }) -- clear search

-- Formatting
vim.api.nvim_set_keymap("n", "<space>q", "gqip", { noremap = true, silent = true }) -- clear search

-- Splits
vim.api.nvim_set_keymap("n", "<space>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>\"", ":split<CR>", { noremap = true, silent = true })

-- Save
vim.api.nvim_set_keymap("n", "<space>s", ":w<CR>", { noremap = true, silent = true })

-- Close current window
vim.api.nvim_set_keymap("n", "<space>x", "<C-w>c", { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap("n", "<space>t", ":tabnew<CR>", { noremap = true, silent = true })

-- FZF Settings
vim.keymap.set("n", "<space>p", ":Files<CR>", { remap = false, silent = true })
vim.keymap.set("n", "<space>f", ":Ag<CR>", { remap = false, silent = true })
vim.keymap.set("n", "<space>b", ":Buffer<CR>", { remap = false, silent = true})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { buffer = args.buf, remap = false, silent = true })
        end

        vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, { buffer = args.buf, remap = false, silent = true })
        vim.keymap.set('n','gD',vim.lsp.buf.declaration, { remap = false, silent = true })
        vim.keymap.set('n','gd',vim.lsp.buf.definition, { remap = false, silent = true })
        vim.keymap.set('n','gr',vim.lsp.buf.references, { remap = false, silent = true })
        vim.keymap.set('n','gs',vim.lsp.buf.signature_help, { remap = false, silent = true })
        vim.keymap.set('n','gi',vim.lsp.buf.implementation, { remap = false, silent = true })
        -- TODO: find something better here
        -- vim.keymap.set('n','gt',vim.lsp.buf.type_definition, { remap = false, silent = true })
        vim.keymap.set('n','<space>gw',vim.lsp.buf.document_symbol, { remap = false, silent = true })
        vim.keymap.set('n','<space>gW',vim.lsp.buf.workspace_symbol, { remap = false, silent = true })
        vim.keymap.set('n','<space>ah',vim.lsp.buf.hover, { remap = false, silent = true })
        vim.keymap.set('n','<space>af',vim.lsp.buf.code_action, { remap = false, silent = true })
        -- TODO: fix this
        -- vim.keymap.set('n','<space>ee',vim.lsp.util.show_line_diagnostics, { remap = false, silent = true })
        vim.keymap.set('n','<space>ar',vim.lsp.buf.rename, { remap = false, silent = true })
        vim.keymap.set('n','<space>=', vim.lsp.buf.formatting, { remap = false, silent = true })
        vim.keymap.set('n','<space>ai',vim.lsp.buf.incoming_calls, { remap = false, silent = true })
        vim.keymap.set('n','<space>ao',vim.lsp.buf.outgoing_calls, { remap = false, silent = true })
    end,
})

-- Easymotion
vim.keymap.set("n", '<space>', '<Plug>(easymotion-prefix)',{remap = false, silent = true})
