set nocompatible
set termguicolors

call plug#begin('~/.config/nvim/plugged')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'metakirby5/codi.vim'
Plug 'leafgarland/typescript-vim'


Plug 'jdkanani/vim-material-theme'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'spoqa/nirum.vim'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/vim-slash'

Plug 'achimnol/python-syntax'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

filetype plugin indent on
syntax on

" Color configuration
set bg=dark
color material-theme

set tabstop=2 shiftwidth=2 softtabstop=2 modeline
set fileformat=unix backspace=2
set autoindent smartindent expandtab
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

au FileType ruby        setl ts=2 sw=2 sts=2
au FileType yaml        setl ts=2 sw=2 sts=2
au FileType html        setl ts=2 sw=2 sts=2
au FileType haml        setl ts=2 sw=2 sts=2
au FileType php         setl ts=2 sw=2 sts=2
au FileType sql         setl ts=2 sw=2 sts=2
au FileType javascript  setl ts=2 sw=2 sts=2 colorcolumn=120
au FileType typescript  setl ts=4 sw=4 sts=4 colorcolumn=120
au FileType python      setl ts=4 sw=4 sts=4
au FileType haskell     setl ts=8 sw=4 sts=4
au FileType make        setl noet
au FileType nirum       setl ts=4 sw=4 sts=4
au Filetype rust        call SetRust()

function SetRust()
    ALEDisable
endfunction

set laststatus=2

command E Explore

set noeb vb t_vb=
set directory=/tmp
set colorcolumn=80

let g:deoplete#enable_at_startup = 1

inoremap <expr> <Tab> ((pumvisible())?("\<C-n>"):("<Tab>"))

"Keep 80 columns.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd WinEnter * match OverLength /\%81v.\+/

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight ExtraWhitespace2 ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
match ExtraWhitespace2 /\s\+\%#/
autocmd WinEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd WinEnter * match ExtraWhitespace2 /\s\+\%#/
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/

set nofoldenable

" neovim configuration

let g:airline_theme='bubblegum'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.crypt = '🔒'

let python_highlight_all = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
\  'haskell': ['stack-build', 'hlint'],
\  'javascript': ['tslint'],
\}

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <Leader>T :enew<CR>

" Move to the next buffer
nmap <Leader>l :bnext<CR>
nmap <Leader>f :bnext<CR>

" Move to the previous buffer
nmap <Leader>h :bprevious<CR>
nmap <Leader>b :bprevious<CR>

" Close the current buffer
nmap <Leader>bq :bd <CR>

" Show all open buffers and their status
nmap <Leader>bl :ls<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'e',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
