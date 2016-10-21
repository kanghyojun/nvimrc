set nocompatible

call plug#begin('~/.config/nvim/plugged')
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'davidhalter/jedi-vim'
Plug 'wting/rust.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml'
Plug 'pbrisbin/vim-syntax-shakespeare'

"Plug 'dracula/vim'
"Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'eagletmt/neco-ghc'
Plug 'simnalamburt/vim-mundo'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'spoqa/nirum.vim'

call plug#end()

filetype plugin indent on
syntax on

" Color configuration
set bg=light
color solarized

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
au FileType javascript  setl ts=2 sw=2 sts=2
au FileType python      setl ts=4 sw=4 sts=4
au FileType haskell     setl ts=8 sw=4 sts=4
au FileType make        setl noet

set laststatus=2

command E Explore

set noeb vb t_vb=

let g:airline_powerline_fonts=1

set directory=/tmp
set colorcolumn=80

noremap <silent> nh :noh<CR>
noremap <silent> tt :F<CR>
nnoremap <F5> :MundoToggle<CR>

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

"Haskell-related config
let g:haskell_quasi         = 0
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
let g:haskell_hsp           = 0
" disable all conceals, including the simple ones like
" lambda and composition
let g:haskell_conceal              = 0
" disable concealing of "enumerations": commatized lists like
" deriving clauses and LANGUAGE pragmas,
" otherwise collapsed into a single ellipsis
let g:haskell_conceal_enumerations = 0

set clipboard=unnamed
set nofoldenable

" nirum configuraiton
au BufNewFile,BufRead *.nrm set filetype=nirum
au FileType nirum       setl ts=4 sw=4 sts=4


" neovim configuration
"let g:python_host_prog = '/Users/ed/src/venv/neovim2/bin/python'
"let g:python3_host_prog = '/Users/ed/src/venv/neovim3/bin/python'
