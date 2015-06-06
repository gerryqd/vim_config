" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible

source $VIMRUNTIME/vimrc_example.vim
"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
filetype  plugin on
filetype  indent on
"
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax    on


"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
"set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
"set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set listchars=tab:\|\ ,trail:-

set mouse=a                     " enable the use of the mouse
set nowrap                      " do not wrap lines
set noundofile
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set shiftwidth=4                " number of spaces to use for each step of indent
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4                   " number of spaces that a <Tab> counts for
set softtabstop=4               "
set expandtab
set list
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set nu                          " show the line number
set showmatch
set noautochdir
set nobackup
set timeout timeoutlen=3000
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set laststatus=2                " show the status bar, show the current file name
set smartcase

set updatetime=100

set guioptions-=T       " Dont use the toolbar in GVIM

set cinoptions=t0,(0,c0
"set equalprg=astyle

"set spell

"set path+=**
set novisualbell
set noswapfile
"colorscheme torte
colorscheme desert
"colorscheme molokai

set cursorline
hi CursorLine cterm=NONE ctermbg=lightblue

let NERDTreeDirArrows=0

" remove all trailing space when saving file
autocmd BufWritePre * :%s/\s\+$//e
" update the file contrent when file is changed outside
autocmd CursorHold * checktime


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags,tags,./ctags

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim


"""""""""""""""""""""""""""""" Source Explorer """""""""""""""""""""""""""""
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" ===================================

" Open and close all the three plugins on the same time
nmap <F8>  :TrinityToggleAll<CR>

" Open and close the Source Explorer separately
nmap <F9>  :TrinityToggleSourceExplorer<CR>

" Open and close the Taglist separately
nmap <F10> :TrinityToggleTagList<CR>

" Open and close the NERD Tree separately
nmap <F11> :TrinityToggleNERDTree<CR>

" =================   Vundle   ====================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'wesleyche/SrcExpl'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/autotags'

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


" ========================== CSCOPE  =============================
if has("cscope")
    set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
    " check cscope for definition of a symbol before checking ctags:
    " set to 1 if you want the reverse search order.
    set csto=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
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


" =============================================================
" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" ======================================================================================
" FuzzyFind
"let g:fuf_coveragefile_globPatterns = ['**/.*', '**/*']
"let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|depend|gitignore|cmd)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
"nmap <F12>   :FufCoverageFile<CR>

nmap <F5> :tp<CR>
nmap <F6> :tn<CR>

" ===================load local .lvimrc (current directory)=================================
"let g:localvimrc_ask=0
let g:localvimrc_persistent=2

let g:prjpath=getcwd()
"au BufWritePost *.c,*.cpp,*.h silent! exe "!ctags -f " . prjpath . "/tags -R " . prjpath . ' &'

fun! UpdateTags()
    silent! exe "!ctags --sort=foldcase -f " . g:prjpath . "/tags -R " . g:prjpath . " &"
    "silent! exe "!ctags --append --sort=yes -f " . g:prjpath . "/tags -R " . g:prjpath . " &"
    "silent! exe "!ctags --append --exclude=.git --sort=yes -f " . g:prjpath . "/tags -R " . g:prjpath . " &"
    silent! exe "!mycs.sh " . g:prjpath . " & "
    silent! cs reset
endfun

"au BufWritePost *.c,*.cpp,*.h call UpdateTags()

let g:autotags_ctags_opts = "--fields=+iaS --extra=+q"
let g:autotags_ctags_global_include = ""
"nmap <F5> :call AutotagsUpdate()<CR>

" grep.vim
let Grep_Default_Filelist = '*.[chS]'
