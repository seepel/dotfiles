" SETTINGS ---------------------------------------------------------------- {{{~~~%{
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Turn syntax highlighting on.
syntax on
" Add numbers to each line on the left-hand side.
set number
" Set shift width to 4 spaces.
set shiftwidth=2
" Set tab width to 4 columns.
set tabstop=2
" Use space characters instead of tabs.
set expandtab
" Do not save backup files.
set nobackup
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
let &t_ut=''

" Indentation
" set autoindent
" set smartindent

" Default to splitting vertically
set splitright
" Can't remember this one
set backspace=indent,eol,start

" }}}}%~~~
"

" PLUGINS ---------------------------------------------------------------- {{{{{{{{{

call plug#begin('~/.vim/plugged')

" Experimental
"
"
Plug 'killphi/vim-ebnf'

Plug 'jackMort/ChatGPT.nvim'
Plug 'github/copilot.vim'

if has('nvim') 
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'MunifTanjim/prettier.nvim'
  Plug 'eliba2/vim-node-inspect'
endif

Plug 'eandrju/cellular-automaton.nvim'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'

Plug 'vimpostor/vim-lumen' 

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

" nvim-lsp stuff
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"" For vsnip users. nvim-lsp needs this
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" eThis doesn't work all of a sudden ¯\_(ツ)_/¯ 
" Plug 'bkad/CamelCaseMotion'
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

" Files
Plug 'tpope/vim-vinegar' " Split windows and the project drawer go together like oil and vinegar.
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
autocmd VimEnter * nmap <c-p> <plug>(ctrlp)
Plug 'lambdalisue/fern.vim'
function! s:init_fern() abort
  echo "This function is called ON a fern buffer WHEN initialized"

  " Open node with 'o'
  nnoremap <buffer> dd <Plug>(fern-action-remove)

  " Add any code to customize fern buffer
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
" Plug 'preservim/nerdtree'
" let NERDTreeHijackNetrw=1
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Status 
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim that's light as air 
Plug 'vim-airline/vim-airline-themes'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_powerline_fonts = 1
" let g:airline_section_b = ' %{GetCurrentBranch()}'   " make sure the branch gets updated every few seconds
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " If fugitive.vim is the Git, rhubarb.vim is the Hub.
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_removed = '−'
let g:gitgutter_sign_modified_removed = '≈'

" Color Schemes
Plug 'cocopon/iceberg.vim' 
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/edge'
Plug 'preservim/vim-colors-pencil'
Plug 'arzg/vim-colors-xcode'
Plug 'sainnhe/everforest'
Plug 'matsuuu/pinkmare'
Plug 'savq/melange-nvim'
Plug 'Th3Whit3Wolf/one-nvim'

" Editing
Plug 'tpope/vim-repeat' " Repeat plugin commands
Plug 'tpope/vim-surround' " Surround with brackets
Plug 'https://github.com/adelarsq/vim-matchit' " Extended matching for the % operator.
Plug 'tpope/vim-sleuth' " Automatically figure out indentation
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" wasm
Plug 'rhysd/vim-wasm'

" Lisp
Plug 'guns/vim-sexp'
Plug 'kovisoft/paredit'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" fennel
Plug 'bakpakin/fennel.vim'

let g:sexp_enable_insert_mode_mappings = 0
let g:sexp_filetypes = 'lisp,scheme,clojure,fennel,wat'
au FileType wast call PareditInitBuffer()

" Editor Config
Plug 'editorconfig/editorconfig-vim'


call plug#end()


" }}}}}}}}}

" MAPPINGS 
let mapleader = " "
let maplocalleader = ","

:nnoremap g. :Fern . -reveal=%<cr>

:noremap <c-s> :w<cr>
:inoremap <c-s> <esc>:w<cr>a

:nnoremap <c-w><c-w> :wq<cr>
:inoremap <c-w><c-w> <esc>:wq<cr>

" LEADER
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:nnoremap <leader>sv :source ~/.vimrc<cr>

" Auto
"

" SETTINGS 

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

colorscheme melange
let g:airline_theme='one'
let g:netrw_liststyle = 3

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

