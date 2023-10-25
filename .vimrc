" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

set backspace=indent,eol,start

let mapleader = ","

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

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

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

" Search the entire tree, not just the first level
set path+=**

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Makes it easier to switch buffers without saving
set hidden

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

" New horizontal split to the bottom
set splitbelow
set splitright

call plug#begin('~/.vim/plugged')

" Plug 'dense-analysis/ale'

 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdcommenter'

 Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'Valloric/YouCompleteMe'
 Plug 'tpope/vim-fugitive'
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'preservim/tagbar'
 Plug 'easymotion/vim-easymotion'
 Plug 'haya14busa/is.vim'
 Plug 'mhinz/vim-grepper'
 Plug 'nelstrom/vim-visual-star-search'

call plug#end()
" }}}
" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" NERDTree Settings
nmap <C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Move between Windows
map <C-h> <C-w>h

map <C-l> <C-w>l

map <C-k> <C-w>k

map <C-j> <C-w>j

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" Replace all instances of selection
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

xnoremap <Leader>r :%s///g<Left><Left>
xnoremap <Leader>rc :%s///gc<Left><Left><Left>

" NERDCommenter mappings
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

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

set tags^=.git/tags

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Make it obvious where 80 characters is
set textwidth=100
set colorcolumn=+1

" Vim-tmux-navigator options
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" If the tmux window is zoomed, keep it zoomed when moving from Vim to another pane
let g:tmux_navigator_preserve_zoom = 1

" open NERDTree automatically
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeGitStatusWithFlags = 1
set mouse=a

set background=dark
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:ycm_global_ycm_extra_conf = '/Users/chirag/ycmd/.ycm_extra_conf.py'
