" Color scheme
" Indent to 4 spaces
set shiftwidth=2
set autoindent
" C style indentation
set cindent

" terminal colorset
:colorscheme desert 
set hlsearch

if !exists("syntax_on")
    syntax on
endif

"let c_comment_strings=1

set mousehide

" line numbers
set nu!

" Page-up and Page-down
:map <space> <c-f>
:map <backspace> <c-b>

:map <F6> :!texi2pdf "%:t" && gs "%:t:r".pdf

" Bash like completion
set wildmode=list:longest

set ignorecase 
set smartcase

set scrolloff=3

au BufWinLeave * mkview
au BufWinEnter * silent loadview
