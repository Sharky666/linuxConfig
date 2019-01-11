filetype plugin indent on

" indent options
:set tabstop=4
:set shiftwidth=4
:set expandtab

" set line numbers
set nu

" set leader to:
let mapleader = " "

" copying
nnoremap <Leader>a :echo "Hey there ,"<CR>
nnoremap <Leader>y "*y
nnoremap <Leader>p "*p
nnoremap <Leader>Y "+y
nnoremap <Leader>P "+p
set clipboard=unnamedplus

filetype plugin indent on    " required
runtime! archlinux.vim

"vim-plug:
call plug#begin('~/.config/nvim/plugged')

"NERDTree:
Plug 'scrooloose/nerdtree'
nnoremap <c-n> :NERDTreeToggle<Enter>
let NERDTreeShowHidden=1

"deoplete:
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" deoplete engines:
" JS:
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

"ALE (lint):
Plug 'w0rp/ale'
let g:ale_linters = {
\	'javascript': ['eslint'],
\	'typescript': ['tslint']
\}

"ALE keybinds:
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"Typescript stuff:
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-dtsm'

"Deoplete setup
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

call plug#end()
