syntax on
com! Giefjson %!python -m json.tool

set path+=**
set wildmenu

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
set expandtab
set shiftwidth=4
set tabstop=4
set showcmd
set scrolloff=10
set number
set relativenumber
set colorcolumn=81
set background=dark
set wildignore=*.o,*~,*.pyc,*dinmamma*
"set hlsearch

" Keep vim from wrapping lines into new rows
set nowrap

let python_highlight_all = 1

" Python 3 support
let g:pymode_python = 'python3'


filetype on
filetype plugin on
filetype indent on

syntax on

"let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
"let g:html_indent_script1="inc"
"let g:html_indent_style1="inc"
noremap <Space> <PageDown>

map <C-h>   <C-w>h
map <C-j>   <C-w>j
map <C-k>   <C-w>k
map <C-l>   <C-w>l

map <f2>    :GoRun<CR>

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
" we want to tell the syntastic module when to run
" " we want to see code highlighting and checks when  we open a file
" " but we don't care so much that it reruns when we close the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_quiet_messages = { "type": "style" }

" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'wikitopian/hardmode'
Plugin 'fatih/vim-go'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
"
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
"
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'nathanalderson/yang.vim'
"Bundle 'Xuyuanp/nerdtree-git-plugin'
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
