set nocompatible

" Init pathogen.vim
call pathogen#infect()

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Below is customized settings
let mapleader = ","

" Allow colors in commandline mode
if !has("gui_running")
    set t_Co=16
    " Color setting for terminal
    colorscheme default
else
    set t_Co=16
    " Color setting for GUI
    colorscheme dbs
endif

" Setup fencview
let g:fencview_autodetect = 0
set statusline=[%n]%<%f%y%h%m[%{&fenc!=''?&fenc:&enc}:%{&ff}]%r%=[%b\ 0x%B]\ %l\ of\ %L,%c%V\ Page\ %N\ %P 

" Change dir to the first opening file
" and don't auto change dir ever.
cd %:p:h
set noautochdir

" Backup setting
set nobackup

" Ignore case sensitive
set ic

" Set highlight search result
set hlsearch

" Set search
set incsearch

" Show line numbers
set nu

" Syntax highlight setting
syntax enable
syntax on

" Tab and indent settings
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Set Tag List
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" Automatically add cscope.out to vim
:cs add .

" Enable quickfix to display cscope's result
:set cscopequickfix=s-,c-,d-,i-,t-,e-

" Set cscope's shortcut
nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Grep config, you can setup grep's path in windows
" or just put grep in your PATH. You can find grep
" in cygwin_commands_for_windows.7z
" I changed grep.vim's grep_expr_option in grep mode
" from '--' to '' in order to input options in file list
" grep.vim version 1.9's Line 489 and Line 742
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <C-F3> :GrepAdd<CR>

let Grep_Default_Filelist = '. --include=*.{}'
let Grep_Default_Options = '-r'
"let Grep_Path = 'C:\shengy\grep\grep.exe'
"let Fgrep_Path = 'C:\shengy\grep\fgrep.exe'
"let Egrep_Path = 'C:\shengy\grep\egrep.exe'
"let Agrep_Path = 'C:\shengy\grep\agrep.exe'
"let Grep_Find_Path = 'C:\shengy\grep\find.exe'
"let Grep_Xargs_Path = 'C:\shengy\grep\xargs.exe'

" Setup vimgrep
"noremap <silent> <C-F3> :call Search_Word()<CR>:copen<CR>
"function Search_Word()
"    let w = expand("<cword>")
"    execute ":noautocmd vimgrep " w "**"
"endfunction

" Set a.vim's shortcut
nnoremap <silent> <F12> :A<CR>

" Set QuickFix's short cut
nnoremap <F7> :cn<CR>
nnoremap <F6> :cp<CR>

" Use F4 to call TagList Only
nnoremap <F4> :Tlist<CR>
let g:Tlist_WinWidth = 50
let g:Tlist_Use_Right_Window = 1

" Use leader F4 to call Nerdtree
nnoremap <leader><F4> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you are using windows:
" At least you need linux's find, echo, grep, ctags, cscope
" You can find them in either cygwin or msys
"
" Take a look at cygwin_commands_for_windows.7z
"
" rename find to gfind and put it in your PATH
" rename echo to gecho and put it in your PATH
" put grep in your PATH
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you are using linux:
" Change the following command's gfind to find
" Change the following command's gecho to echo
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add more file types if you need.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-F11> :cs kill -1<CR>
         \ :!gfind . -iname '*.c' -exec gecho "\"{}\"" ';' 
         \ -o -iname '*.cpp' -exec gecho "\"{}\"" ';' 
         \ -o -iname '*.cc' -exec gecho "\"{}\"" ';'
         \ -o -iname '*.h' -exec gecho "\"{}\"" ';'
         \ -o -iname '*.hpp' -exec gecho "\"{}\"" ';'
         \ -o -iname '*.java' -exec gecho "\"{}\"" ';'
         \ -o -iname '*.php' -exec gecho "\"{}\"" ';'
         \ -o -iname '*.pl' -exec gecho "\"{}\"" ';'
         \ -o -iname '*.py' -exec gecho "\"{}\"" ';' > cscope.files <CR>
         \:!cscope -b -i cscope.files -f cscope.out<CR>
         \:cs add .<CR>
         \:cs reset<CR>

" This is for quickly updating cscope file without using GNU find
nnoremap <silent> <C-F5> :cs kill -1<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs add .<CR>
  \:cs reset<CR>

" Refresh ctags with Ctrl+F12
nnoremap <C-F12> <esc>:!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<cr>

" Delete spaces after each line
nnoremap <silent> <F2> :%s/\s\+$//g <CR>

" Tasklist configure
" This can't be a nore map because it's written in
" tasklist.vim
nmap <silent> <C-T> <Plug>TaskList

let g:tlTokenList = ['TODO', 'DBS', 'DBSM', 'dbs', 'dbsm']

" Bufexplorer
noremap <silent> <C-Tab> :BufExplorer<CR>

" FuzzyFinder
noremap <silent> <C-\> :FufTag<CR>

" CtrlP config

" Set this to 1 to set searching by filename (as opposed to full path) as the
" default: >
let g:ctrlp_by_filename = 1

" Set this to 1 to set regexp search as the default: >
let g:ctrlp_regexp = 1

" 1 - the parent directory of the current file.
" 2 - the nearest ancestor that contains one of these directories or files:
"     .git/ .hg/ .svn/ .bzr/ _darcs/
" 0 - don't manage working directory.
let g:ctrlp_working_path_mode = 0

" Set this to 1 to enable the lazy-update feature: only update the match window
" after typing been stopped for a certain amount of time: >
"
" If is 1, update after 250ms. If bigger than 1, the number will be used as the
" delay time in milliseconds.
let g:ctrlp_lazy_update = 1

" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 0

" Set the maximum height of the match window: >
let g:ctrlp_max_height = 70

" In addition to |'wildignore'|, use this for files and directories you want only
" CtrlP to not show. Use regexp to specify the patterns: >
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.elf$\|\.o$\
             \|\.vsd$\|\.vsdx$\|\.doc$\|\.docx$\
             \|\.xls$\|\.xlsx$',
  \ 'link': '',
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programming language support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pydiction
" let g:pydiction_location = 'C:\Program Files\Vim\vim73\ftplugin\complete-dict'

" Omnifun's auto complete
set nocp
filetype plugin indent on
set completeopt=longest,menu
set wildmenu

" ccomplete will be override by omnicppcomplete later.
set omnifunc=syntaxcomplete#Complete

" Omnicpp's setup
" set tags+=tags;    
" set tags+=C:/Program\ Files/boost\boost_1_47\boost\tags  
" set tags+=C:\MinGW\lib\gcc\mingw32\4.5.2\include\tags; 

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.cc,*.c,*.h set omnifunc=omni#cpp#complete#Main

" OmniCpp config
let OmniCpp_GlobalScopeSearch = 1  " 0 or 1  
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2  
let OmniCpp_DisplayMode = 1  
let OmniCpp_ShowScopeInAbbr = 0  
let OmniCpp_ShowPrototypeInAbbr = 1  
let OmniCpp_ShowAccess = 1  
let OmniCpp_MayCompleteDot = 1  
let OmniCpp_MayCompleteArrow = 1  
let OmniCpp_MayCompleteScope = 1 

" guifont for linux
" set guifont=Monospace\ 12

" guifont for mac
" set guifont=Monaco:h12

" guifont for windows
" set guifont=Fixedsys:h12

