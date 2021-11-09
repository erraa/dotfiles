" Cheat sheet
" zz / zt - scroll to top / middle relative to position
" gt / gT / :newtab - tab
" Ctrl+O / Ctrl-I / :jumps - jump
" gU / gu  - make lower / uppercase
" ga - show ascii
" gd - go to definition
" gf - open file
" gV - reselect visual
" C-N / C-P keyword completion
" C-X C-O mega awesome omni completion
" C-X C-L complete whole line
"
" Normal mode
" -----------
" ds  - delete a surrounding
" cs  - change a surrounding
" ys  - add a surrounding
" yS  - add a surrounding and place the surrounded text on a new line + indent it
" yss - add a surrounding to the whole line
" ySs - add a surrounding to the whole line, place it on a new line + indent it
" ySS - same as ySs
"
" Visual mode
" -----------
" s   - in visual mode, add a surrounding
" S   - in visual mode, add a surrounding but place text on new line + indent it
"
" Insert mode
" -----------
" <CTRL-s> - in insert mode, add a surrounding
" <CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
" <CTRL-g>s - same as <CTRL-s>
" <CTRL-g>S - same as <CTRL-s><CTRL-s>
"
syntax on
com! Giefjson %!python -m json.tool
com! Json %!jq '.'
com! XML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

set path+=**
set wildmenu
set backspace=indent,eol,start

let skip_defaults_vim=1

set expandtab
set shiftwidth=4
set tabstop=4
set showcmd
set scrolloff=10
set number
set relativenumber
set colorcolumn=81
set background=dark
set wildignore=*.o,*~,*.pyc
set pastetoggle=<F1>
set wildmode=longest,list,full
set splitbelow splitright
set nohlsearch

" Keep vim from wrapping lines into new rows
set nowrap

let python_highlight_all = 1

" Python 3 support
let g:pymode_python = 'python3'

filetype on
filetype plugin on
filetype indent on

let mapleader = " "
vnoremap < <gv
vnoremap > >gv

map <C-h>   <C-w>h
map <C-j>   <C-w>j
map <C-k>   <C-w>k
map <C-l>   <C-w>l

map <f2>    :GoRun<CR>

noremap <c-s> :update<CR>

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

autocmd BufNewFile,BufRead *.json set ft=javascript

" Get rid of trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" setup Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" # Install vim-sensible
" git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
"
" # Install syntastic
" git clone https://github.com/scrooloose/syntastic.git
" ~/.vim/bundle/syntastic

"call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"call plug#end()
"

Bundle 'ervandew/supertab'
Bundle "lepture/vim-jinja"
Bundle 'chase/vim-ansible-yaml'
Bundle 'scrooloose/nerdtree'
Bundle 'nathanalderson/yang.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'wikitopian/hardmode'
Plugin 'fatih/vim-go'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'

" disablejedivim
let g:jedi#completions_enabled = 1
let g:jedi#force_py_version = 3

Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'AndrewRadev/splitjoin.vim'


call vundle#end()            " required

call plug#begin('~/.vim/plugged')
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

filetype plugin indent on    " required

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }

inoremap <C-Space> <C-x><C-o>


" Markdown folding disabled
let g:vim_markdown_folding_disabled = 1

" CTRL P remap
nnoremap <c-p> :CtrlPClearCache<bar>CtrlP<cr>

" Scripts
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.

" use goimports for formatting
 let g:go_fmt_command = "goimports"

" " turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:o_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
set updatetime=100



let g:syntastic_go_checkers = ['go', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

if has("gui_running")
  colorscheme evening
  let macvim_skip_colorscheme = 1
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>
endif

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader>t :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader>t :exe "tabn ".g:lasttab<cr>
