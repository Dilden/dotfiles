set nocompatible              " be iMproved, required
filetype off                  " required
set number
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set autochdir
set wildignore+=vendor/**,mail/**,runtime/**
let $BASH_ENV = "~/.bash_aliases"

syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color scheme
Plugin 'morhetz/gruvbox'

" File Tree
Plugin 'scrooloose/nerdtree'

" Search files
Plugin 'ctrlpvim/ctrlp.vim'
" Install ripgrep as well (https://github.com/BurntSushi/ripgrep)
Plugin 'dyng/ctrlsf.vim'

" Multi-cursor support
Plugin 'terryma/vim-multiple-cursors'

" Surrounding tags
Plugin 'tpope/vim-surround'

" Upgraded status line
Plugin 'itchyny/lightline.vim'

" Syntax checks
Plugin 'vim-syntastic/syntastic'

" Git
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme gruvbox
set background=dark

" Python path (required for autocomplete plugin)
" let g:python3_host_prog = 'c:\\Users\\dylan\\AppData\\Local\\Programs\\Python\\Python37-32\\python.exe'
set encoding=utf-8

" Auto start NERDtree
autocmd vimenter * NERDTree
map <C-k> :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeShowHidden = 1 

" search settings
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlp_custom_ignore = {
	\ 'dir': 'vendor\|.git\$'
	\}

" code quality
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" status line config
set noshowmode
let g:lightline = {
	\ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\ 	'right': [ [ 'lineinfo' ], ['absolutepath'] ]
    \ },
	\ 'component_function': {
	\ 	'gitbranch': 'fugitive#head'
	\ },
	\ }
