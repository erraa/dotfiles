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

set path+=**
set wildmenu


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

" Keep vim from wrapping lines into new rows
set nowrap

let python_highlight_all = 1

" Python 3 support
let g:pymode_python = 'python3'

filetype on
filetype plugin on
filetype indent on

syntax on

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
" Copy between files
set viminfo='100,\"2500,:200,%,n~/.viminfo


" setup Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" # Install pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
" # Install vim-sensible
" git clone git://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
"
" # Install syntastic
" git clone https://github.com/scrooloose/syntastic.git
" ~/.vim/bundle/syntastic
execute pathogen#infect()


Bundle 'ervandew/supertab'
Bundle "lepture/vim-jinja"
Bundle 'chase/vim-ansible-yaml'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'nathanalderson/yang.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'elzr/vim-json'
Plugin 'wikitopian/hardmode'
Plugin 'fatih/vim-go'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'
" disablejedivim
let g:jedi#completions_enabled = 0
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'AndrewRadev/splitjoin.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {
	\   'python': [ 're!\w{2}' ]
	\ }
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" we want to tell the syntastic module when to run
" " we want to see code highlighting and checks when  we open a file
" " but we don't care so much that it reruns when we close the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_quiet_messages = { "type": "style" }

" Scripts
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction


" use goimports for formatting
 let g:go_fmt_command = "goimports"

" " turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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
