set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'digitaltoad/vim-jade'
call vundle#end()

filetype plugin indent on

let g:solarized_termcolors=256
set nu
set ts=2
set sw=2
set smartindent

syntax enable
set background=light
