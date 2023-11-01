" Configuración de Gabriel

" General

    " Disable compatibility with vi which can cause unexpected issues.
    set nocompatible

    " Enable type file detection. Vim will be able to try to detect the type of file in use.
    filetype on

    " Enable plugins and load plugin for the detected file type.
    filetype plugin on

    " Always use unicode
    set encoding=utf-8          

" Look & feel

    " Turn syntax highlighting on.
    syntax on

    " Add numbers to each line on the left-hand side.
    set number

    " Highlight cursor line underneath the cursor horizontally.
    set cursorline

    " Highlight cursor line underneath the cursor vertically.
    set cursorcolumn

    " Default Color Scheme
    colorscheme evening

    " Show partial command you type in the last line of the screen.
    set showcmd

    " Set the splits to open at the right side and below
    " set splitbelow splitright   

"Indention Options

    " Load an indent file for the detected file type.
    filetype indent on

    " Set shift width to 4 spaces.
    set shiftwidth=4

    " Set tab width to 4 columns.
    set tabstop=4

    " Insert "tabstop" number of spaces when the "tab" key is pressed.
    set smarttab

    " Use space characters instead of tabs.
    set expandtab

    " New lines inherit the indentation of previous lines.
    set autoindent

    " When shifting lines, round the indentation to the nearest multiple of 'shiftwidth.'
    set shiftround



" PLUGINS ---------------------------------------------------------------- {{{

    " Plugin code goes here.

    " Automatic installation.
    " Install vim-plug if not found
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    
    " Run PlugInstall if there are missing plugins
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
    \| endif

    "Llamada a plugins
    call plug#begin('~/.vim/plugged')
        " Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
        " NERD tree will be loaded on the first invocation of NERDTreeToggle command
        Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'https://github.com/airblade/vim-gitgutter.git'

    call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

    " Mappings code goes here.

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

    " This will enable code folding.
    " Use the marker method of folding.
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
    augroup END

    " More Vimscripts code goes here.

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

    " Status bar code goes here.

" }}}

