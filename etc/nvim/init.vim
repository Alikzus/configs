" Neovim Configuration File
" Author: Joel A. Hänel <joel@hanel.nu>, 2014-2018
" Last changed: 2018-08-19 14:59:32 CEST
"

let g:timestamp_modelines="15"	" must be set before the module is loaded

""------------------------------------------------------------------------------
"" Plug
if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugin' }
Plug 'neomake/neomake'
Plug 'ervandew/supertab'
Plug 'vim-scripts/timestamp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jwhitley/vim-colors-solarized'
call plug#end()

""------------------------------------------------------------------------------

set number      " Show line numbers
set cursorline  " Highlight the cursor line

set background=dark
colorscheme solarized

"" Highlight column 81 and then the range above #120.
let &colorcolumn="81,".join(range(120,999),",")

"" Whitespace
"set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'

"" Searching
"""set ignorecase                  " searches are case insensitive...
"""set smartcase                   " ... unless they contain at least one capital letter

""------------------------------------------------------------------------------
"" Timestamp
let timestamp_regexp = '\v\C%(<Last %([Cc]hanged?|[Mm]odified|[Uu]pdated)\s*:\s+)@<=\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2} \a+|2018-08-19 14:59:32 CEST'
let timestamp_rep = '%F %T %Z'

""------------------------------------------------------------------------------
"" Airline
let g:airline_solarized_bg='dark'

""------------------------------------------------------------------------------
"" Neomake
call neomake#configure#automake('nrwi', 500)
