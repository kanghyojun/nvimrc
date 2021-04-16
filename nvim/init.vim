set nocompatible
set termguicolors

call plug#begin('~/.config/nvim/plugged')
Plug 'editorconfig/editorconfig-vim' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
" Extra syntax highlighters
Plug 'spoqa/nirum.vim'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'udalov/kotlin-vim'
Plug 'hashivim/vim-terraform'

" Autocomplete, Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Extra util function
Plug 'junegunn/vim-slash'

Plug 'ayu-theme/ayu-vim'
call plug#end()

filetype plugin indent on
syntax on

" Color configuration
let ayucolor="mirage"
colorscheme ayu

set fileformat=unix backspace=2
set autoindent smartindent expandtab
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr
set noeb vb t_vb=
set directory=/tmp

command E Explore
command F FZF
command FA call fzf#vim#files(<q-args>, {'source': 'rg -l --no-ignore-vcs --hidden --iglob !.git ""', 'down': '20%'})
command B Buffers
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%') :
  \             fzf#vim#with_preview('right:50%:hidden', '?'),
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

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))
inoremap <expr> <S-Tab> ((pumvisible())?("\<C-p>"):("\<S-Tab>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))
inoremap <C-c> <Esc>

set nofoldenable

"Indents
set ts=4 sw=4 softtabstop=4 modeline
set colorcolumn=80

au FileType typescript  setl ts=4 sw=4 sts=4 colorcolumn=120
au FileType typescriptreact  setl syntax=typescript ts=4 sw=4 sts=4 colorcolumn=120
au FileType javascript  setl ts=2 sw=2 sts=2 colorcolumn=120
au FileType yaml        setl ts=2 sw=2 sts=2
au FileType ruby        setl ts=2 sw=2 sts=2
au FileType yaml        setl ts=2 sw=2 sts=2
au FileType html        setl ts=4 sw=4 sts=4
au FileType haml        setl ts=2 sw=2 sts=2
au FileType php         setl ts=2 sw=2 sts=2
au FileType sql         setl ts=2 sw=2 sts=2
au FileType python      setl ts=4 sw=4 sts=4 completeopt-=preview
au FileType haskell     setl ts=8 sw=4 sts=4
au FileType elm         setl ts=4 sw=4 sts=4
au FileType make        setl noet
au FileType nirum       setl ts=4 sw=4 sts=4
au FileType json        setl ts=4 sw=4 sts=4

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

set updatetime=1500

vnoremap // "ly/\V<C-R>=escape(@l,'/\')<CR><CR>
vnoremap ?? "ly:Rg <C-R>=escape(@l,'/\')<CR><CR>
vnoremap ??? "ly:Rg! <C-R>=escape(@l,'/\')<CR><CR>

let g:terraform_fmt_on_save=1
let g:rustfmt_autosave = 1

" GoTo code navigation.
nmap <silent> gl <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <Leader>r :call CocAction('format')<CR>:w<CR>
nmap <Leader>rn <Plug>(coc-rename)
