-- Install plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
-- easymotion is deprecated think about using https://github.com/phaazon/hop.nvim

vim.call('plug#end')
-------------------

-- Stop vim from auto inserting newlines
vim.opt.textwidth = 0

-- Disable automatic continuation of comment lines
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- fix highlighting for quick-scope
vim.cmd[[
highlight QuickScopePrimary gui=underline cterm=underline
highlight QuickScopeSecondary gui=underline cterm=underline
]]

-- KEYBIDINGS

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

vim.keymap.set("n", "<space>q", "gqip", default_opts) -- clear search

-- Save
vim.keymap.set("n", "<space>s", ":w<CR>", default_opts)

-- Close current window
vim.keymap.set("n", "<space>x", "<C-w>c", default_opts)

-- Tabs
vim.keymap.set("n", "<space>t", ":tabnew<CR>", default_opts)

-- Easymotion
vim.keymap.set("n", "<space>", "<Plug>(easymotion-prefix)", default_opts)

-- Some vimscript
-- function split_window()
-- vim.cmd([[
-- let g:multiline_list = [
--             \ 1,
--             \ 2,
--             \ 3,
--             \ ]
-- 
-- echo g:multiline_list
-- ]])
-- end

-- https://github.com/vscode-neovim/vscode-neovim/issues/298
vim.opt.clipboard:append("unnamedplus")

-- VSCode specific keybindings

--
vim.keymap.set("n", "<space>t", ":call VSCodeNotify('workbench.action.terminal.focus', 1)<CR>", default_opts)
vim.keymap.set("n", "<C-f>", ":call VSCodeNotify('workbench.action.findInFiles', 1)<CR>", default_opts)
vim.keymap.set("n", "<C-r>", ":call VSCodeNotify('workbench.action.replaceInFiles', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>n", ":call VSCodeNotify('search.action.focusNextSearchResult', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>N", ":call VSCodeNotify('search.action.focusPreviousSearchResult', 1)<CR>", default_opts)
--vim.keymap.set("n", "<space>p", ":call VSCodeNotify('workbench.action.quickOpen', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>b", ":call VSCodeNotify('workbench.action.quickOpen', 1)<CR>", default_opts)
-- vim.keymap.set("n", "<space>o", ":call VSCodeNotify('workbench.action.showCommands', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>[", ":call VSCodeNotify('workbench.action.showAllSymbols', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>s", ":call VSCodeNotify('workbench.action.files.save', 1)<CR>", default_opts)

-- vim.keymap.set("n", "<space>s", ":call VSCodeNotify('editor.action.showHover', 1)<CR>", default_opts)

-- Splits
vim.keymap.set("n", "<space>v", ":call VSCodeNotify('workbench.action.splitEditorRight', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>\"", ":call VSCodeNotify('workbench.action.splitEditorDown', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>x", ":call VSCodeNotify('workbench.action.closeActiveEditor', 1)<CR>", default_opts)

-- GoTo
vim.keymap.set("n", "gr", ":call VSCodeNotify('references-view.findReferences', 1)<CR>", default_opts)

-- Peek
vim.keymap.set("n", "gpd", ":call VSCodeNotify('editor.action.peekDefinition', 1)<CR>", default_opts)
vim.keymap.set("n", "gpD", ":call VSCodeNotify('editor.action.peekDefinition', 1)<CR>", default_opts)
vim.keymap.set("n", "gpx", ":call VSCodeNotify('togglePeekWidgetFocus', 1)<CR>", default_opts)

-- Copilot
vim.keymap.set("n", "<space>cp", ":call VSCodeNotify('inlineChat.startWithCurrentLine', 1)<CR>", default_opts)

