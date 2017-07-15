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

" Indentation
set tabstop=8
set softtabstop=0
set noexpandtab
set colorcolumn=80
" Package manager
"execute pathogen#infect()

" Vundle
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
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

call vundle#end()

filetype indent on
filetype plugin indent on

" Color Scheme
set background=dark
colorscheme solarized 
set t_Co=16
" let g:solarized_termtrans=1
let g:airline_theme='solarized'
let g:airline_section_warning = 0

" Visual Settings
syntax on
set number
set showcmd
set cursorline
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set laststatus=2
set ruler

set wildmenu

set showmatch

" Auto reload open buffers
set autoread

set incsearch
set hlsearch

" Clear highlighting done by search.
map <silent> \ :let @/=""<cr>

" Leader related convenience shortcuts
let mapleader=" "
nmap <leader>0 :cd /local/statview<CR>
nmap <leader>1 :cd /local/onefs<CR>
nmap <leader>2 :cd /local/onefs/isilon<CR>
nmap <leader>3 :cd /local/onefs/isilon/lib<CR>
nmap <leader>4 :cd /local/onefs/isilon/lib/isi_stats<CR>
nmap <leader>5 :cd /local/onefs/isilon/lib/isi_statview<CR>
nmap <leader>6 :cd /local/onefs/isilon/lib/isi_platform_api/<CR>
nmap <leader>7 :cd /local/obj/mnt/src/onefs<CR>
nmap <leader>8 :cd /local/obj/mnt/src/onefs/isilon/lib<CR>
nmap <leader>9 :cd /local/obj/mnt/src/onefs/isilon/lib/isi_platform_api<CR>
nmap <leader>q :Bdelete<CR>
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

" Key Bindings
" nnoremap <c-b> :buffers<CR>
nnoremap <c-b> :CtrlPBuffer<CR>
nnoremap <c-m> :CtrlPMRU<CR>
" CtrlP Plugin
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

" highlight system.types/stat files as C-files
augroup StatTypesHighlight
	au BufRead,BufNewFile *.stat setfiletype cpp
	au BufRead,BufNewFile *.types setfiletype cpp
augroup END
