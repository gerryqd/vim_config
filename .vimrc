" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible " or   set nocp

" Always display English interface
set langmenu=en_US
let $LANG = 'en_US.UTF-8'
set encoding=utf-8


"source $VIMRUNTIME/vimrc_example.vim
"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
filetype  plugin on
filetype  indent on

syntax on

"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:\|\ ,trail:-
set nolist
set modelines=0
"set colorcolumn=85
set ttyfast

set mouse=a                     " enable the use of the mouse
if !has("gui_running")
    set ttymouse=xterm2             " use mouse in terminal
endif
set nowrap                      " do not wrap lines
"set wrap
set noundofile
set nobackup
set noswapfile
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set shiftwidth=4                " number of spaces to use for each step of indent
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4                   " number of spaces that a <Tab> counts for
set softtabstop=4               "
set expandtab
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set number                      " show the line number
set showmatch
set noautochdir
set timeout timeoutlen=3000
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set laststatus=2                " show the status bar, show the current file name
set smartcase
set updatetime=100
set cursorline
set guioptions-=T       " Dont use the toolbar in GVIM
set guioptions-=m       " Do not use the menu bar
set guioptions-=L       " Hide left side scrollbar
" set guioptions -=r      " Hide right side scrollbar
"set guifont=Source_Code_Pro_Semibold:h10:cANSI
set guifont=Source_Code_Pro:h10:cANSI

set cinoptions=t0(0,W4c0g0N-s

"set spell

" ======================================================
colorscheme molokai
" =========================================================
" remove all trailing space when saving file
"autocmd BufWritePre * :%s/\s\+$//e

" update the file content when file is changed outside
autocmd CursorHold * checktime
autocmd FocusGained * redraw!
" =========================  NERDTree ====================================
" let NERDTreeDirArrows = 0
let NERDTreeWinPos = "right"
let NERDTreeHijackNetrw = 0
nmap <silent> <F9> :NERDTreeToggle<CR>
" =================   Vundle   ====================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
"Plugin 'jlebar/ctrlp-py-matcher'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/a.vim'
Plugin 'majutsushi/tagbar'
Plugin 'embear/vim-localvimrc'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/mru.vim'
Plugin 'will133/vim-dirdiff'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

" ================== vim airline =========================
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled  = 0

let g:airline_powerline_fonts = 1

" ================== ag.vim =========================
let g:ag_highlight=1

" ==================  ctrlp  =============================
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|a|dll)$|GTAGS$|GRTAGS$|GPATH$',
  \ }

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
"let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0

" PyMatcher for CtrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" ------------ use ag to speed up ctrlp ------------
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" =============== tagbar ===============
"
let g:tagbar_left = 1
nmap <silent> <F7> :TagbarToggle<CR>

" =================== vim-multiple-cursors =======================
let g:multi_cursor_next_key='<C-s>'

" =================== a.vim =========================
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../export'

" ========================== CSCOPE  =============================
set csprg=gtags-cscope
if has("cscope")
    set cscopetag
    " check cscope for definition of a symbol before checking ctags:
    " set to 1 if you want the reverse search order.
    set csto=1

    " add any cscope database in current directory
    if filereadable("GTAGS")
        cs add GTAGS
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB !=""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <F5> :cp<CR>
nmap <F6> :cn<CR>

" =============================================================
" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" =========  local vimrc =========
" default local vimrc file is .lvimrc
let g:localvimrc_persistent = 2

" ===================================================
" easymotion

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" =========================================================
" no blink screen and bell
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set t_ut=

" ============================================================

