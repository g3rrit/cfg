-- Flags
ENABLE_SPELL = true

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

-- Nerdtree
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

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
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

-- Plug 'hrsh7th/cmp-vsnip'
-- Plug 'hrsh7th/vim-vsnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- Utils
Plug 'nvim-lua/plenary.nvim'

-- Scala LSP
Plug('scalameta/nvim-metals', { ['requires'] = { "nvim-lua/plenary.nvim" }})

-- Tmux integration
Plug 'christoomey/vim-tmux-navigator'

-- Inline color visualization
Plug 'ap/vim-css-color'

-- Parenthesis colors
Plug 'frazrepo/vim-rainbow'

-- Latex
Plug 'lervag/vimtex'

-- Debug Adapter
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

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

-- Set left margin (used by lsp) to always be present
vim.opt.signcolumn = "yes:1"

-- Add parenthisis rainbow colors
vim.g.rainbow_active = 1

-- Automatically reload files once branch is changed
-- In order for this to work, some autocommands within lua/auto_cmds.lua are also required
vim.opt.autoread = true

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
    vim.opt.spell = true
    vim.opt.spelllang = "en,nb"
    vim.opt.spellfile = "/usr/local/cfg/nvim/spell/en.utf-8.add"
    -- Add word to spell-file `zg`
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
  tab = '│ ',
  extends = '⟩',
  precedes = '⟨',
  trail = '·'
}

vim.opt.list = true

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

-- Change timeoutlen
vim.opt.timeoutlen = 1000

-- vsnip directory
-- vim.g.vsnip_snippet_dir = "/usr/local/cfg/nvim/vsnip"


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

------------------------------------------------------------------------------------------------------------------------
-- MODULES
------------------------------------------------------------------------------------------------------------------------

require("keybindings")
require("commands")
require("lsp_setup")
require("cmp_setup")
require("tex_setup")
require("auto_cmds")
require("luasnip_setup")
require("dap_setup")
require("auto_run")
