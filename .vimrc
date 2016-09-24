	set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'L9'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'digitaltoad/vim-jade'
Plugin '4Evergreen4/vim-hardy'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'elzr/vim-json'
Plugin 'briancollins/vim-jst'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'FuzzyFinder'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jalcine/cmake.vim'
Plugin 'mhinz/vim-startify'
Plugin 'guns/xterm-color-table.vim'
Plugin 'jacoborus/tender'

call vundle#end()
filetype plugin indent on
filetype plugin on

"""""""""""""""""""""""""" General/ vim configuration """"""""""""""""""""""""
set encoding=utf-8
set t_Co=256
set bg=dark
set nu
set ts=4
set sw=4
set si
set cursorline
set backspace=2
set wrap
set mouse=a
colorscheme tendercustom
syntax enable
set colorcolumn=+1
set clipboard=unnamed
set laststatus=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Custom maps
map <Leader>P :set paste<CR>
map :Q :q<CR>
map <C-s> :w<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim Git Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^-'
let g:gitgutter_sign_modified_removed = '%-'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:tender_airline = 1
let g:airline_theme = 'tender'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '$'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'PASTE'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Arduino
let g:hardy_arduino_path = '/Applications/Arduino.app/Contents/MacOS/Arduino'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD Tree
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"	: "~",
			\ "Staged"		: "+",
			\ "Untracked" : "*",
			\ "Renamed"   : "%",
			\ "Unmerged"  : "=",
			\ "Deleted"   : "x",
			\ "Dirty"     : "✗",
			\ "Clean"			: "✔︎",
			\ "Unknown"   : "?",
			\ }
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tasklist
map <C-t>v <Plug>TaskList
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LatexBox
map <Leader>lt :LatexTOC<CR>
map <Leader>lm :Latexmk<CR>
map <Leader>lv :LatexView<CR>
map <Leader>lb :Latexmk<CR>:LatexView<CR>:LatexmkClean<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-json
let g:vim_json_syntax_conceal = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Javascript Standard
let g:syntastic_javascript_checkers = ['standard']
autocmd bufwritepost *.js silent !standard-format -w %
set autoread
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
