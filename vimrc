" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load Plugins
call plug#begin('~/.vim/plugged')

" Depends on
"   - bat
"   - fzf
"   - ripgrep
"   - the_silver_searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Plugin Options
nnoremap <silent> <leader>p :Files <C-R>=GetProjectDir()<CR><CR>
nnoremap <silent> <leader>f :Ag <C-R>=GetProjectDir()<CR><CR>
nnoremap <silent> <leader>b :Buffer<CR>

" Turn on syntax highlighting
syntax on

" Colorscheme
colorscheme pear

" For plugins to load correctly
filetype plugin indent on

" Set leader key
let mapleader = "\\"

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=80
set wrapmargin=0
set colorcolumn=81 " highlight column
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Relative line numbers
set relativenumber

" Show trailing whitespace:
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

" Splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>" :split<CR>

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
nmap <leader><space> :let @/=''<cr> " clear search

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


" Commands
function! GetProjectDir()
    return finddir('.git/..', expand('%:p:h').';')
endfunction

command! GetProjectDir call GetProjectDir()

