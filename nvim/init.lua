-- Flags
ENABLE_SPELL = false

-- Install plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Depends on
--   - bat
--   - fzf
--   - ripgrep
--   - the_silver_searcher
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'

vim.call('plug#end')
--------------------

-- Global Helper variables
HOME_DIR = os.getenv("HOME")

-- Backup directory
vim.opt.backupdir = HOME_DIR .. "/.vim/backup"

-- Set encoding
vim.opt.encoding= "utf-8"

-- Enable true color mode
vim.opt.termguicolors = true

-- Helps force plugins to load correctly when it is turned back on below
vim.opt.filetype = "off"

-- Colorscheme Settings

vim.opt.background = "light"
vim.g.gruvbox_contrast_light = "hard"
vim.cmd("colorscheme gruvbox")

-- Set leader key
vim.g.mapleader = "<Space>"

-- FZF Settings
vim.api.nvim_set_keymap("n", "<leader>p", ":Files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":Ag<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Buffer<CR>", { noremap = true, silent = true })

-- Set left margin (used by lsp) to always be present
vim.opt.signcolumn = "yes:1"

-- Automatically reload files once branch is changed
-- TODO
-- vim.opt.autoread = true
-- au CursorHold,CursorHoldI * checktime
-- au FocusGained,BufEnter * :checktime
-- Trigger `autoread` when files changes on disk
-- " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
-- autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
-- autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

-- Security
vim.opt.modelines = 0

-- Show line numbers
vim.opt.number = true

-- Show file stats
vim.opt.ruler = true

-- Blink cursor on error instead of beeping (frr)
vim.opt.visualbell = true

-- Spellchecking
if ENABLE_SPELL then
    vim.opt.spelllang = "en"
    vim.opt.spellfile = "/usr/local/conf/nvim/spell/en.utf-8.add"
    vim.opt.spellspell = true
    -- Add word to spell-file `fg`
    -- Go to next and previous misspelled word `]s`, `[s`
end

-- Whitespace
vim.opt.wrap = true
vim.opt.textwidth= 120
vim.opt.wrapmargin= 0
vim.opt.colorcolumn= "121" -- highlight column
vim.opt.formatoptions = "tcqrn1"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftround = false

-- Stop vim from auto inserting newlines
vim.opt.textwidth = 0

-- Relative line numbers
vim.opt.relativenumber = true

-- Show trailing characters
vim.opt.listchars = {
  tab = '│·',
  extends = '⟩',
  precedes = '⟨',
  trail = '·'
}

-- Cursor motion
vim.opt.scrolloff = 3
vim.opt.backspace = { "indent", "eol", "start" }

-- Move up/down editor lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Splits
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>\"", ":split<CR>", { noremap = true, silent = true })

-- Save
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })

-- Close current window
vim.api.nvim_set_keymap("n", "<leader>x", "<C-w>c", { noremap = true, silent = true })

-- Tabs
vim.api.nvim_set_keymap("n", "<leader>t", ":tabnew<CR>", { noremap = true, silent = true })

-- Allow hidden buffers
vim.opt.hidden = true

-- Rendering
vim.opt.ttyfast = true

-- Status bar
vim.opt.laststatus = 2

-- Last line
vim.opt.showmode = true
vim.opt.showcmd = true

-- Searching
vim.api.nvim_set_keymap("n", "/", "/\v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "/", "/\v", { noremap = true, silent = true })
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.api.nvim_set_keymap("n", "<leader><space>", ":let @/=''<cr>", { noremap = true, silent = true }) -- clear search

-- Formatting
vim.api.nvim_set_keymap("n", "<leader>q", "gqip", { noremap = true, silent = true }) -- clear search

-- TODO
-- map <leader>l :set list!<CR> " Toggle tabs and EOL

-- autocmd BufReadPost *.[ch] let b:commentType='//' "C files
-- autocmd BufReadPost *.pl let b:commentType='#'    "Perl files

-- TODO
-- jump to the previous function
-- nnoremap <silent> [f :call search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{',"bw")<CR>
-- jump to the next function
-- nnoremap <silent> ]f :call search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{',"w")<CR>

--" Commands
--function! GetProjectDir()
--    return finddir('.git/..', expand('%:p:h').';')
--endfunction
--
--command! GetProjectDir call GetProjectDir()
--

-- command! MakeScratch lua require'utils'.make_scratch()
-- command! -nargs=+ ExecCmd lua require'utils'.exec_cmd(false, <f-args>)
-- command! -nargs=+ ExecCmdK lua require'utils'.exec_cmd(true, <f-args>)

--function! ReloadUtils() abort
--    lua for k in pairs(package.loaded) do if k:match("^utils") then package.loaded[k] = nil end end
--    lua require("utils")
--endfunction

--command! ReloadUtils call ReloadUtils()

require("lspsetup")

