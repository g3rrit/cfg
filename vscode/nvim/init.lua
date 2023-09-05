vim.cmd([[
set runtimepath=/usr/local/cfg/vscode/nvim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,/usr/local/cfg/vscode/nvim/after
set packpath=/usr/local/cfg/vscode/nvim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,/usr/local/cfg/vscode/nvim/after
]])

-- Install plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'asvetliakov/vim-easymotion'
Plug 'justinmk/vim-sneak'

vim.call('plug#end')
-------------------

-- Stop vim from auto inserting newlines
vim.opt.textwidth = 0

-- Disable automatic continuation of comment lines
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")


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

-- VSCode specific keybindings

vim.keymap.set("n", "<space>o", ":call VSCodeNotifyVisual('workbench.action.showCommands', 1)<CR>", default_opts)

--
vim.keymap.set("n", "<space>t", ":call VSCodeNotifyVisual('workbench.action.terminal.focus', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>f", ":call VSCodeNotifyVisual('workbench.action.findInFiles', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>r", ":call VSCodeNotifyVisual('workbench.action.replaceInFiles', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>n", ":call VSCodeNotifyVisual('search.action.focusNextSearchResult', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>N", ":call VSCodeNotifyVisual('search.action.focusPreviousSearchResult', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>p", ":call VSCodeNotifyVisual('workbench.action.quickOpen', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>o", ":call VSCodeNotifyVisual('workbench.action.showCommands', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>[", ":call VSCodeNotifyVisual('workbench.action.showAllSymbols', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>s", ":call VSCodeNotifyVisual('workbench.action.files.save', 1)<CR>", default_opts)

-- vim.keymap.set("n", "<space>s", ":call VSCodeNotifyVisual('editor.action.showHover', 1)<CR>", default_opts)

-- Splits
vim.keymap.set("n", "<space>v", ":call VSCodeNotifyVisual('workbench.action.splitEditorRight', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>\"", ":call VSCodeNotifyVisual('workbench.action.splitEditorDown', 1)<CR>", default_opts)
vim.keymap.set("n", "<space>x", ":call VSCodeNotifyVisual('workbench.action.closeActiveEditor', 1)<CR>", default_opts)
