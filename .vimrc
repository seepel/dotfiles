" SETTINGS ---------------------------------------------------------------- {{{
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

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

" Experimental
Plug 'eandrju/cellular-automaton.nvim'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'

Plug 'vimpostor/vim-lumen' 

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

if has('nvim')
  Plug 'Olical/conjure'
endif

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

" Editing
Plug 'tpope/vim-repeat' " Repeat plugin commands
Plug 'tpope/vim-surround' " Surround with brackets
Plug 'https://github.com/adelarsq/vim-matchit' " Extended matching for the % operator.
Plug 'tpope/vim-sleuth' " Automatically figure out indentation
Plug 'zhaocai/GoldenView.Vim' "Always have a nice view for vim split windows 
Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
      \ 'coc-json', 'coc-git', 'coc-tsserver', 'coc-html',
      \ 'coc-clojure', 'coc-css' ]
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <tab> :IcedFormat <cr>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> gp :cprev<cr>
nnoremap <silent> gn :cnext<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references) 

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Lisp
Plug 'guns/vim-sexp'
Plug 'kovisoft/paredit'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
if has('nvim')
  Plug 'Olical/conjure'
endif

" fennel
Plug 'bakpakin/fennel.vim'

let g:sexp_enable_insert_mode_mappings = 0
let g:sexp_filetypes = 'fennel'

" Clojure
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-salve'
" Plug 'liquidz/vim-iced', {'for': 'clojure'}
let g:iced_enable_default_key_mappings = v:true
" let g:iced#nrepl#auto#does_switch_session = v:true
" Plug 'liquidz/vim-iced-multi-session', {'for': 'clojure'}
" let g:iced_multi_session#definitions = [
"     \ {'port_file': printf('%s/.nrepl-port', expand('<sfile>:p:h')),
"     \  'path': 'src/',
"     \  'name': 'server'},
"     \ {'port_file': printf('%s/.shadow-cljs/nrepl.port', expand('<sfile>:p:h')),
"     \  'path': 'src/',
"     \  'name': 'client'},
"     \ ]
Plug 'liquidz/vim-iced-fern-debugger', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

" Editor Config
Plug 'editorconfig/editorconfig-vim'


call plug#end()


" }}}

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

colorscheme one
let g:airline_theme='one'
let g:netrw_liststyle = 3

" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

