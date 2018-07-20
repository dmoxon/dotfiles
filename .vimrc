" General Settings
set nocompatible
set noswapfile
set nobackup
set history=500
set ttyfast

" Mouse Mode
set mouse=a
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end
" Clipboard support needed
set clipboard=unnamed

" Default Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Backspace fix
set backspace=indent,eol,start

" Package manager
"execute pathogen#infect()

" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'simplyzhao/cscope_maps.vim'
Plugin 'moll/vim-bbye'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'taglist.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'kshenoy/vim-signature'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'GEverding/vim-hocon'

call vundle#end()

if has("autocmd")
  " Enable the file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Put files in ~/.vim/after/ftplugin
  filetype plugin indent on
  " ...
endif

" Custom rules for file types

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

"let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax
" Weird Isilon C/C++ indentation
" autocmd Filetype c setlocal ts=8 sw=8 sts=0 noexpandtab
" autocmd Filetype cpp setlocal ts=8 sw=8 sts=0 noexpandtab

" Example indentation specifics for individual languages
" autocmd Filetype html setlocal ts=2 sw=2 expandtab
" autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
" autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
" autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
" autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab

" Color Scheme
set background=dark
colorscheme solarized
" colorscheme base16-default-dark
set t_Co=16
" let g:solarized_termtrans=1
let g:airline_theme='solarized'
let g:airline_section_warning = 0

" Visual Settings
syntax on
set number
set showcmd
"set cursorline
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set laststatus=2
set ruler
"Place 80 character column indicator
set colorcolumn=80

set wildmenu

set showmatch

" Auto reload open buffers
set autoread

set incsearch
set hlsearch

" Key Bindings

" Clear highlighting done by search.
map <silent> \ :let @/=""<cr>

" Leader related convenience shortcuts
let mapleader=" "
"nmap <leader>0 :cd /local/statview<CR>
nmap <leader>q :Bdelete<CR>

"Netcat for piping yank over ssh tunnel
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

inoremap jj <ESC>

"Plugin Settings

" CtrlP Plugin
nnoremap <c-b> :CtrlPBuffer<CR>
" nnoremap <c-b> :buffers<CR>
nnoremap <c-m> :CtrlPMRU<CR>

let g:ctrlp_map = ''
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path=0
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:100'
let g:ctrlp_cache_dir = '/home/dmoxon/.cache/ctrlp'

" FZF
"nunmap <c-p>
nnoremap <c-p> :Files<CR>

" Cscope Maps
set nocscopeverbose

" Conque GDB
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1 

" TagList
nnoremap <c-l> :TlistOpen<CR>
let Tlist_WinWidth=50
"let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
let Tlist_Compact_Format=1
let Tlist_Show_One_File=1

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" highlight system.types/stat files as C-files
augroup StatTypesHighlight
	au BufRead,BufNewFile *.stat setfiletype cpp
	au BufRead,BufNewFile *.types setfiletype cpp
augroup END

" Grep commands
command! -nargs=+ Ngrep execute 'silent grep! <args>' | copen 20
command! -nargs=+ Vim execute 'vim <args>' | copen 20
