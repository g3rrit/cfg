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

-- Motion
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

-- Git
Plug 'tpope/vim-fugitive'

-- Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

-- Utils
Plug 'nvim-lua/plenary.nvim'

-- Scala LSP
Plug('scalameta/nvim-metals', { ['requires'] = { "nvim-lua/plenary.nvim" }})

-- tmux integration
Plug 'christoomey/vim-tmux-navigator'

-- Inline color visualization
Plug 'ap/vim-css-color'

-- Parenthesis colors
Plug 'frazrepo/vim-rainbow'

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
vim.keymap.set("n", "<space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = "<space>"

-- Set left margin (used by lsp) to always be present
vim.opt.signcolumn = "yes:1"

-- Add parenthisis rainbow colors
vim.g.rainbow_active = 1

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
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- Disable automatic continuation of comment lines
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

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

-- Load other modules
require("keybindings")
require("commands")
require("lsp_setup")
require("cmp_setup")

