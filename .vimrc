" Color scheme
" Indent to 4 spaces
set tabstop=2
set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on


set shiftwidth=2
set expandtab
set autoindent
"" C style indentation
"set cindent

"" terminal colorset
:colorscheme desert 
set hlsearch

""let c_comment_strings=1

set mousehide

"" line numbers
set nu!

"" Page-up and Page-down
:map <space> <c-f>
:map <backspace> <c-b>

:map <F6> :!texi2pdf "%:t" && gs "%:t:r".pdf

"" Bash like completion
set wildmode=list:longest

set ignorecase 
set smartcase

set scrolloff=3

"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview

retab

set spell spelllang=en_us
setlocal spell spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"" where it should get the dictionary files
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
