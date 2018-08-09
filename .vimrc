" Vundle config

set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"From here other plugins from the original Vundle config
Plug 'scrooloose/nerdtree'        
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf',

"Other Plugins 
"""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'
Plug 'python-mode/python-mode'
Plug 'vim-scripts/ctrlp.vim'
Plug 'vim-scripts/supertab'
Plug 'majutsushi/tagbar'
Plug 'lervag/vimtex'
Plug 'jvirtanen/vim-octave'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plugin of color schemes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'noahfrederick/vim-hemisu'
Plug 'veloce/vim-aldmeris'
Plug 'tomasr/molokai'
"SnipMate plugins
""""""""""""""""""""""""""""""""""""
" Multiple Plug commands can be written in a single line using | separators
Plug 'MarcWeber/vim-addon-mw-utils'|Plug 'tomtom/tlib_vim'|Plug 'garbas/vim-snipmate'
" Optional:
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" End of Vundle config

" General
set number  " Show line numbers
set linebreak " Break lines at word (requires Wrap lines)
set showbreak=+++ " Wrap-broken line prefix
set textwidth=100 " Line wrap (number of cols)
set showmatch " Highlight matching brace
set visualbell  " Use visual bell (no beeping)
 
set hlsearch  " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch " Searches for strings incrementally
 
set autoindent  " Auto-indent new lines
set expandtab " Use spaces instead of tabs
set shiftwidth=2  " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab  " Enable smart-tabs
set softtabstop=2 " Number of spaces per Tab
 
" Advanced
set ruler " Show row and column ruler information
 
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
 
 
" Generated by VimConfig.com

set mouse=a " activate mouse

" Autoload NERDTree if no file specified

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto close NERDTree if no more files

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files in NERDTree

let NERDTreeShowHidden=1


" enable copy to clipboard

set clipboard=unnamed

" copy to clipboard with Ctrl-C

map <C-x> :!pbcopy<cr>
vmap <C-c> :w !pbcopy<cr><cr>

" paste from clipboard with Ctrl-V
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" maps for Tagbar and Ctags
nnoremap <silent> <F9> :TagbarToggle<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-e> :edit.<cr>

"""""""""""""""""""""""""""
" Git-gutter configuration
"""""""""""""""""""""""""""

let g:gitgutter_updatetime = 750
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

"""""""""""""""""""""""""""
" Syntastic configuration
"""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" so that syntastic uses .jshintrc files if present - http://stackoverflow.com/questions/28573553/how-can-i-make-syntastic-load-a-different-checker-based-on-existance-of-files-in

autocmd FileType javascript let b:syntastic_checkers = findfile('.jshintrc', '.;') != '' ? ['jshint'] : ['standard']

"""""""""""""""""""""""""""
" Custom (no plugin related)
"""""""""""""""""""""""""""

" show filename
set statusline+=%F

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
syntax on 
let mapleader = ","
let g:mapleader = ","
" Tell vim to use colors which look good on a dark/light background
set t_Co=256
nnoremap <silent> <Leader>bg :call ToggleBackground()<cr>
function! ToggleBackground()
    if &background == "light"
        set background=dark
                " Color scheme
        try
        colorscheme gruvbox
        catch
        endtry
    else
        set background=light
         " Color scheme
        try
        colorscheme PaperColor
        catch
        endtry

    endif
endfunction
        set background=dark
         " Color scheme
        try
        colorscheme gruvbox
        catch
        endtry
        " For MacVim
        set guifont=Monaco:h16
" Highlight current cursor line, <leader>c to toggle on and off
set nocursorline
hi CursorLine cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white
nnoremap <leader>c :set cursorline!<cr>

" Fast saving and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" Close the current buffer
map <leader>bd :bd<cr>
" Cycle through listed buffers
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tt :tabnext<cr>
map <leader>tp :tabp<CR>


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"---------------------------------------------------------------
" LATEX LIVE PREVIEWER
" --------------------------------------------------------------
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
set nofoldenable

"-------------------------------------------------------------
" AIRLINE
" ------------------------------------------------------------
" enable powerline fonts
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1

"  airline symbols dictionary
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols, for multiple definitions choose one
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols, needed if powerline fonts are installed
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"
"-------------------------------------------------------------
" Ctags
" ------------------------------------------------------------

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
