" ~/.vimrc -- configuration for vim, Vi IMproved: a programmers text editor
"
" Copyright (c) 2014-2016, Joel A. Nilsson <joel@alikzus.se>
" 
" Permission to use, copy, modify, and/or distribute this software for any
" purpose with or without fee is hereby granted, provided that the above
" copyright notice and this permission notice appear in all copies.
" 
" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
" REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
" AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
" INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
" LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
" OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
" PERFORMANCE OF THIS SOFTWARE.
"

execute pathogen#infect()

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" File format
set fileformat=unix
set fileformats=unix,dos

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Timestamp configuration
let timestamp_regexp = '\v\C%(<Last %([Cc]hanged?|[Mm]odified|[Uu]pdated)\s*:\s+)@<=\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2} \a+|TIMESTAMP'
let timestamp_rep = '%F %T %Z'

" Show line numbers.
set number

" Highlight column 81 and then the range above #120.
let &colorcolumn="81,".join(range(120,999),",")

" Set color for the highlight.
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Color scheme.
set background=dark
colorscheme solarized

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Needed by vim-airline
set laststatus=2

"-------------------------------------------------------------------------------
" Key mappings
map <C-n> :NERDTreeToggle<CR>   " NERDTree

"-------------------------------------------------------------------------------
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-------------------------------------------------------------------------------
" Correct the vim cursor in tmux
if exists('$TMUX') 
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"-------------------------------------------------------------------------------
" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"-------------------------------------------------------------------------------
" Last updated: 2016-02-13 13:28:55 CET
