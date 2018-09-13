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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finder plugin
"Other Plugins 
"""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'
Plug 'python-mode/python-mode'
Plug 'Valloric/YouCompleteMe',{'do':'python3 install.py'}
Plug 'vim-scripts/ctrlp.vim'
Plug 'vim-scripts/supertab'
Plug 'majutsushi/tagbar'
Plug 'lervag/vimtex'
Plug 'jvirtanen/vim-octave'
Plug 'yxrdydh/vim-latex-live-preview'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plugin of color schemes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'noahfrederick/vim-hemisu'
Plug 'veloce/vim-aldmeris'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'nanotech/jellybeans.vim'

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
set wrap
set linebreak " Break lines at word (requires Wrap lines)
set display+=lastline
"set showbreak=+++ " Wrap-broken line prefix
set textwidth=0 " Line wrap (number of cols)
set spelllang=en_us " My default language is American English
set grepprg=~/.vim/scripts/ack
" Use # without VIM moving it to the first column
inoremap # X<C-H># " Use # without VIM moving it to the first column
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
let g:syntastic_quiet_messages = { 'regex': '\ldots' }

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
        let g:airline_theme = "gruvbox"
    else
        set background=light
         " Color scheme
        try
        colorscheme hybrid_material
        catch
        endtry
        let g:airline_theme = "gruvbox"
    endif
endfunction
        set background=light
         " Color scheme
        try
        colorscheme hybrid_material
        catch
        endtry
        let g:airline_theme = "gruvbox"
        " For MacVim
        set guifont=Monaco:h16
        set guioptions= "remove all the sidebars
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
autocmd Filetype tex setl updatetime=1000
"let g:livepreview_previewer = 'open -a PDF\ Expert'
"let g:livepreview_previewer = 'evince'
"let g:livepreview_previewer = 'open -a texshop'
"let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_previewer = 'open -a Skim'
set nofoldenable

"-------------------------------------------------------------
"gitgutter
"-------------------------------------------------------------
"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'
""-------------------------------------------------------------
" AIRLINE
" ------------------------------------------------------------
" enable powerline fonts
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" show tab number in tab line
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#vimtex#left = ""
let g:airline#extensions#vimtex#right = ""
"
set laststatus=2 " Show the statusline
set noshowmode " Hide the default mode text
"  airline symbols dictionary
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
if has("gui_running")
  set guifont=MesloLGSDZForPowerline-Regular:h16
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" show absolute file path in status line
"let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

"-------------------------------------------------------------
" Ctags
" ------------------------------------------------------------

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'


" http://stackoverflow.com/questions/13848429/is-there-a-way-to-have-window-navigation-wrap-around-in-vim<Paste>
function! s:GotoNextWindow( direction, count )
  let l:prevWinNr = winnr()
  execute a:count . 'wincmd' a:direction
  return winnr() != l:prevWinNr
endfunction
function! s:JumpWithWrap( direction, opposite )
  if ! s:GotoNextWindow(a:direction, v:count1)
    call s:GotoNextWindow(a:opposite, 999)
  endif
endfunction
nnoremap <silent> <C-w>h :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w>j :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w>k :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w>l :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
nnoremap <silent> <C-w><Left> :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w><Down> :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w><Up> :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w><Right> :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
" persistent undo
if has("persistent_undo")
    set undodir=~/.vim/undo/
    set undofile
    au BufWritePre /tmp/* setlocal noundofile
endif

" Return current working directory (in quotes) if either autochdir is on or a
" symlink has been followed. Otherwise, return empty string. To be used for
" display in the status line
function! StatusCwd()
  if exists("+autochdir")
    if &autochdir
      return '"' . getcwd() . '"/'
    endif
  endif
  if exists("b:followed_symlink")
    return '"' . getcwd() . '"/'
  endif
  return ''
endfunction!
" Tagbar (and legacy Taglist ) plugin
let Tlist_Inc_Winwidth = 0 " Taglist: Don't enlarge the terminal
"noremap <silent> <leader>t :TlistToggle<CR><C-W>h
noremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_show_linenumbers = 0
let g:tagbar_sort = 0
let g:tagbar_left = 1
let g:tagbar_foldlevel = 2
"use ~/.vim/ctags.cnf This depends on a patched version of the tagbar plugin
"(pull request #476)
let g:tagbar_ctags_options = ['NONE', split(&rtp,",")[0].'/ctags.cnf']
" the definition below depend on the settings in ctags.cnf
let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : [
        \ 't:struct', 'f:function', 'm:macro', 'c:const']
    \ }
" LaTeX to Unicode substitutions
"  This is mainly for Julia, but I also like to use it for Python and others
let g:latex_to_unicode_file_types = [
    \ "julia", "python", "mail", "markdown", "pandoc", "human"]
noremap <silent> <leader>l :call LaTeXtoUnicode#Toggle()<CR>
" go to defn of tag under the cursor (case sensitive)
" adapted from http://tartley.com/?p=1277
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('<cword>')
    catch /.*/
        echo v:exception
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <c-]> :call MatchCaseTag()<CR>

"***********************************************************************
"YouCompleteMe setting
"***********************************************************************

set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" SirVer/ultisnips 代码片断
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["plugged/vim-snippets/UltiSnips"]
" 参考https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-62941322
" 解决ultisnips和ycm tab冲突，如果不使用下面的办法解决可以参考
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-63205056的配置
" begin
" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" end
" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction
" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
