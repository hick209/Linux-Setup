" My VIM configurations

" Identation and TABs
    set autoindent
    set smartindent
    set smarttab
    set shiftwidth=4
    set tabstop=4
    set expandtab

" Mouse usage
    set mouse=a

" Make the backspace work properly
    set backspace=2

" Manage the plugins
    execute pathogen#infect()
    filetype plugin indent on

" Make sure the syntax highlight is on
    syntax on

