
" Simon's common vimrc file - for Mac, Windows and *nix

" Start pathogen
call pathogen#infect()

" Use Vim settings, rather than Vi settings (much better!).
set nocompatible		            " This must be first

" Set status line details
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Plugin stuff
filetype plugin indent on       " load file type plugins + indentation

" Set leader to comm
let mapleader=","

" Open/load global vimrc
nnoremap <leader>s :source $MYVIMRC
nnoremap <leader>v <C-w><C-s><C-l>:e ~/Dropbox/Programs/dotfiles/vimrc<cr>
nnoremap <leader>b <C-w><C-s><C-l>:e ~/Documents/Dropbox/Programs/dotfiles/vimrc<cr>

" NERDTree functions
nnoremap <leader>n :NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == 'primary') | q | endif

" Set encoding
set encoding=utf-8

" Syntax highlighting
syntax enable

" Fix crazy blue comments in terminal
hi Comment ctermfg = gray

" Map f11 to toggle background
map <F11> :let &background = ( &background == "dark" ? "light" : "dark" ) <CR>

" Buffers hide, not close
set hidden

" scrap the arrow keys!
  inoremap  <Up>     <NOP>
  inoremap  <Down>   <NOP>
  inoremap  <Left>   <NOP>
  inoremap  <Right>  <NOP>
  noremap   <Up>     <NOP>
  noremap   <Down>   <NOP>
  noremap   <Left>   <NOP>
  noremap   <Right>  <NOP>
  inoremap  <F1>     <ESC>

" Make things a bit nicer 
  nnoremap  ; :
  map Q <nop>

" Ctrl and shift move keys to move between buffers
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
" nnoremap J <C-w>j<C-w>_
" nnoremap K <C-w>k<C-w>_
" nnoremap H <C-w>h<C-w>_
" nnoremap L <C-w>L<C-w>_

" Splitting buffers
nnoremap <silent> <C-n> <C-w>n<C-w>_
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Set line numbers or relative line numbers
" set number
set relativenumber

" Tab and indent  setting
set tabstop=4 shiftwidth=4      " a tab is four spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set backspace=2			            " more powerful backspaces (?)
set autoindent                  " autoindent
"set nowrap			                " don't wrap lines

" DON'T keep a backup file
set nobackup

" Save on focus loss
au FocusLost * silent! :wa

" Show cursor position
set ruler

" Show incomplete commands
set showcmd

" Quickly leave insert mode
inoremap jj <ESC>
inoremap jk <ESC>
inoremap KJ <ESC>

" Somehow fix movement keys
nnoremap j gj
nnoremap k gk

" Create lines staying in Normal Mode
nnoremap <silent> zj o<Esc>	
nnoremap <silent> zk O<Esc>

" Fix typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Change errors to visual
set visualbell
set noerrorbells

" Searching
set hlsearch       " highlight matches
set incsearch      " incremental searching
set ignorecase     " searches are case insensitive...
set smartcase      " ... unless they contain at least one capital letter
"nnoremap <esc> :noh<return><esc>
