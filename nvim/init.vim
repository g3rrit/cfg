" Flags
let g:enable_lsp = 0
let g:enable_spell = 0

" Enable true color mode
set termguicolors

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load Plugins
call plug#begin('~/.config/nvim/plugged')

" Depends on
"   - bat
"   - fzf
"   - ripgrep
"   - the_silver_searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'

call plug#end()

"
"local Plug = vim.fn['plug#']
"vim.call('plug#begin', '~/.config/nvim/plugged')
"Plug 'wellle/targets.vim'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
"vim.call('plug#end')

" Colorscheme Settings

set background=light
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox

" FZF Settings
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>f :Ag<CR>
nnoremap <silent> <leader>b :Buffer<CR>

" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Set leader key
nnoremap <SPACE> <Nop>
"let mapleader = " "
map <Space> <Leader>

" Set left margin (used by lsp to always be present
set signcolumn=yes:1

" Automatically reload files once branch is changed
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
" Trigger `autoread` when files changes on disk
" " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (frr)
" set visualbell

" Encoding
set encoding=utf-8

" Spellchecking
if g:enable_spell
    set spelllang=en
    set spellfile=/usr/local/conf/nvim/spell/en.utf-8.add
    set spell
    " Add word to spell-file `fg`
    " Go to next and previous misspelled word `]s`, `[s`
endif

" Whitespace
set wrap
set textwidth=120
set wrapmargin=0
set colorcolumn=121 " highlight column
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Stop vim from auto inserting newlines
set textwidth=0

" Relative line numbers
set relativenumber

" Show trailing whitespaces:
match ExtraWhitespace /\s\+$/

" Highlights
highlight ExtraWhitespace ctermbg=red guibg=red
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Not working
noremap <leader>j <C-d>
noremap <leader>k <C-u>

" Splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>" :split<CR>

" Save
nnoremap <leader>s :w<CR>

" Close current window
nnoremap <leader>x <C-w>c

" Tabs
nnoremap <leader>t :tabnew<CR>

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
nnoremap <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

autocmd BufReadPost *.[ch] let b:commentType='//' "C files
autocmd BufReadPost *.pl let b:commentType='#'    "Perl files

" jump to the previous function
nnoremap <silent> [f :call search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{',"bw")<CR>
" jump to the next function
nnoremap <silent> ]f :call search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{',"w")<CR>

" LSP Settings
" https://github.com/palantir/python-language-server/blob/develop/vscode-client/package.json

" LSP mappings
if g:enable_lsp
    nmap <leader>k :LspHover<cr>
    nnoremap gd mP:LspDefinition<cr>
    nnoremap gD mP:LspDeclaration<cr>

    " Clang format
    noremap = :pyf /usr/share/clang/clang-format.py<cr>
endif

" Commands
function! GetProjectDir()
    return finddir('.git/..', expand('%:p:h').';')
endfunction

command! GetProjectDir call GetProjectDir()

command! MakeScratch lua require'utils'.make_scratch()
command! -nargs=+ ExecCmd lua require'utils'.exec_cmd(false, <f-args>)
command! -nargs=+ ExecCmdK lua require'utils'.exec_cmd(true, <f-args>)

function! ReloadUtils() abort
    lua for k in pairs(package.loaded) do if k:match("^utils") then package.loaded[k] = nil end end
    lua require("utils")
endfunction

command! ReloadUtils call ReloadUtils()

lua require("lspsetup")

