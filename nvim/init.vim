set nocompatible

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/seoul256.vim'

Plug 'vim-airline/vim-airline'

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
Plug 'dag/vim2hs'
Plug 'pbrisbin/vim-syntax-shakespeare'

Plug 'scrooloose/syntastic'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()

filetype plugin indent on
syntax on

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

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

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
autocmd InsertChange * match ExtraWhitespace2 /\s\+\%#/
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/

set laststatus=2

command E Explore

set noeb vb t_vb=
autocmd GUIEnter * set vb t_vb=

let g:airline_powerline_fonts=1

set directory=/tmp
set colorcolumn=80
set clipboard=unnamed

let g:seoul256_background = 236
color seoul256

set guifont=Source\ Code\ Pro\ for\ Powerline:h14

noremap <silent> nh :noh<CR>

let g:deoplete#enable_at_startup = 1

inoremap <expr> <Tab> ((pumvisible())?("\<C-n>"):("<Tab>"))
