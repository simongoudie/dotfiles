" Simon's common vimrc file - for Mac, Windows and *nix

" Start pathogen
set nocp
execute pathogen#infect()

set background=dark
colorscheme solarized

" Set $DROPBOX directory
let $DROPBOX = "~/Dropbox"
"if has("windows")
"    let $DROPBOX = "~/Documents/Dropbox"
"else
"   let $DROPBOX = "~/Dropbox"
"endif

" Set status line details
set laststatus=2
set statusline=%F%m%r%h%w\ [%Y]\ [B%n]\ [Line:%l/%L]\ [Col:%c%V]

" Plugin stuff
filetype plugin indent on       " load file type plugins + indentation

" Language specific tabs
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Set leader to comma
let mapleader=","

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

" But don't keep a backup file
set nobackup

" Spellcheck on
" set spell
" set spelllang=en

" Larger windows window
"if has("windows")
"    set lines=50 columns=100
"endif

" Open/load global vimrc
nmap <silent> <leader>v <C-w><C-s><C-l>:e $DROPBOX/Programs/dotfiles/vimrc<CR>
nmap <silent> <leader>V <C-w><C-s><C-l>:e ~/dotfiles/vimrc<CR>
nmap <silent> <leader>s :so $MYVIMRC<CR>

" Open Markdown reference file
nnoremap <leader>m <C-w><C-s><C-l>:e $DROPBOX/Programs/dotfiles/MDRef.txt<cr>

" Open current file in Marked
:nnoremap <leader>p :silent !open -a Marked.app '%:p'<cr>

" NERDTree functions
nnoremap <leader>n :NERDTree <cr>
" autocmd vimenter * if !argc() | NERDTree | endif
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

" scrap the arrow keys! (resize buffer)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
nnoremap <left>  :3wincmd <<cr>
nnoremap <right> :3wincmd ><cr>
nnoremap <up>    :3wincmd +<cr>
nnoremap <down>  :3wincmd -<cr>
inoremap <c-left> <C-W>h<C-W>_
inoremap <c-right> <C-W>l<C-W>_
inoremap <c-up> <C-W>k<C-W>_
inoremap <c-down> <C-W>j<C-W>_

" Ctrl and shift move keys to move between buffers
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>

" Change where splits appear
set splitbelow
set splitright

" Make things a bit nicer 
nnoremap  ; :
map Q <nop>

" Splitting buffers
nnoremap <silent> <C-n> <C-w>n<C-w>_
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Set line numbers or relative line numbers
if version >= 703
    set relativenumber
else 
    set number
endif

" Tab and indent  setting
set tabstop=4 shiftwidth=4      " a tab is four spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set backspace=2			        " more powerful backspaces (?)
set autoindent                  " autoindent
"set nowrap			            " don't wrap lines
"set wrap                       "wrap lines
set formatoptions=1             " ??? format options
set lbr                         " virtual line breaks?

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

" Move by screen lines, not real ones 
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Create lines staying in Normal Mode
nnoremap <silent> zj o<Esc>	
nnoremap <silent> zk O<Esc>

" Fix typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Clear highlights
nmap <silent> <leader>h :nohlsearch<CR>

" Change errors to visual
set visualbell
set noerrorbells

" Searching
set hlsearch       " highlight matches
set incsearch      " incremental searching
set ignorecase     " searches are case insensitive...
set smartcase      " ... unless they contain at least one capital letter

" Markdown
nmap <leader>M :%!/usr/local/bin/Markdown.pl --html4tags <cr>
nmap <leader>m :%!/usr/local/bin/Markdown.pl --html4tags <cr>

" Save as superuser
nmap <leader>W :w !sudo tee %<CR>
nmap <leader>w :w !sudo tee %<CR>

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>

" pickup md files as markdown
au BufRead,BufNewFile *.md set filetype=markdown
