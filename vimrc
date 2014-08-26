" ~/.vimrc -- VIM configuration file.
" joel@alikzus.se, 2014-08-23.
" http://www.alikzus.se

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Show line numbers.
set number

"" Highlight column 81 and then the range above #120.
let &colorcolumn="81,".join(range(120,999),",")

" Set color for the highlight.
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

"" Color scheme.
set background=dark
colorscheme solarized

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

