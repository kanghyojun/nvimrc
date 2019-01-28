set nocompatible
set termguicolors

call plug#begin('~/.config/nvim/plugged')
Plug 'editorconfig/editorconfig-vim' 

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jdkanani/vim-material-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'

" Extra syntax highlighters
Plug 'spoqa/nirum.vim'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
call plug#end()

filetype plugin indent on
syntax on

" Color configuration
set bg=dark
color material-theme

set fileformat=unix backspace=2
set autoindent smartindent expandtab
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set noeb vb t_vb=
set directory=/tmp

command E Explore
command F FZF
command B Buffers
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

set hidden

let mapleader=" "
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

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
