" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax on

" Colorscheme
" 256 colors defined in https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
set t_Co=256
colorscheme pear

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

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_diagnostics_float_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim-lsp.log')

" Autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

call plug#end()

" Plugin Options

let g:rooter_patterns = ['!=theme', 'package.json', '.git']

" nnoremap <silent> <leader>p :Files <C-R>=GetProjectDir()<CR><CR>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>f :Ag<CR>
" nnoremap <silent> <leader>f :Ag <C-R>=GetProjectDir()<CR><CR>
nnoremap <silent> <leader>b :Buffer<CR>

" For plugins to load correctly
filetype plugin indent on

" Set leader key
nnoremap <SPACE> <Nop>
"let mapleader = " "
map <Space> <Leader>

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
set visualbell

" Encoding
set encoding=utf-8

" Spellchecking
set spelllang=en
set spellfile=/usr/local/conf/vim/spell/en.utf-8.add
set spell
" Add word to spell-file `fg`
" Go to next and previous misspelled word `]s`, `[s`

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
nmap <leader>k :LspHover<cr>
nnoremap gd mP:LspDefinition<cr>
nnoremap gD mP:LspDeclaration<cr>

" Clang format
noremap = :pyf /usr/share/clang/clang-format.py<cr>

" Commands
function! GetProjectDir()
    return finddir('.git/..', expand('%:p:h').';')
endfunction

command! GetProjectDir call GetProjectDir()

" Explore mode open multiple files with J + T
" https://vi.stackexchange.com/a/13351
" TODO

