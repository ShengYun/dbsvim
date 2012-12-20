set nocompatible
" source $VIMRUNTIME/mswin.vim
" behave mswin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mswin.vim start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set options and add mapping such that Vim behaves a lot like MS-Windows
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Apr 02

" bail out if this isn't wanted (mrsvim.vim uses this).
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
  finish
endif

" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
" noremap <C-A> gggH<C-O>G
" inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
" cnoremap <C-A> <C-C>gggH<C-O>G
" onoremap <C-A> <C-C>gggH<C-O>G
" snoremap <C-A> <C-C>gggH<C-O>G
" xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" restore 'cpoptions'
set cpo&
if 1
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mswin.vim end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Allow colors in commandline mode
if !has("gui_running")
    set t_Co=16
    " Color setting for terminal
    :colorscheme default
else
    set t_Co=16
    " Color setting for GUI
    :colorscheme torte
    :colorscheme dbs
endif

" Setup fencview
let g:fencview_autodetect = 0
set statusline=[%n]%<%f%y%h%m[%{&fenc!=''?&fenc:&enc}:%{&ff}]%r%=[%b\ 0x%B]\ %l\ of\ %L,%c%V\ Page\ %N\ %P 

" Set swap to the temp folder
" set dir=$TEMP

" Don't auto change dir
" You should call noautochdir manualy after
" opening your gvim window
set autochdir
" set noautochdir

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

" set noexpandtab
set expandtab

" Set Tag List
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" Automatically add cscope.out to vim
:cs add .

" Enable quickfix to display cscope's result
:set cscopequickfix=s-,c-,d-,i-,t-,e-

" Set cscope's short cut
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Set Grep's short cut and the grep path
" This is using the external grep.exe, but the Rgrep is not good
" So I comment it out, and changed to use vimgrep
"nnoremap <silent> <C-F3> :Rgrep<CR>
"let Grep_Path = 'C:\shengy\grep\grep.exe'
"let Fgrep_Path = 'C:\shengy\grep\fgrep.exe'
"let Egrep_Path = 'C:\shengy\grep\egrep.exe'
"let Agrep_Path = 'C:\shengy\grep\agrep.exe'
"let Grep_Find_Path = 'C:\shengy\grep\find.exe'
"let Grep_Xargs_Path = 'C:\shengy\grep\xargs.exe'

" Setup vimgrep
map <silent> <C-F3> :call Search_Word()<CR>:copen<CR>
function Search_Word()
    let w = expand("<cword>")
    execute ":noautocmd vimgrep " w "**"
endfunction

" Set a.vim's shortcut
nnoremap <silent> <F12> :A<CR>

" Set QuickFix's short cut
nmap <F7> :cn<CR>
nmap <F6> :cp<CR>

" Combine WinManager and TagList
" let g:winManagerWindowLayout='FileExplorer|TagList'
" let g:winManagerWidth=35
" nmap <F4> :WMToggle<CR>

" Use F4 to call TagList Only
nmap <F4> :Tlist<CR>
let g:Tlist_WinWidth = 50
let g:Tlist_Use_Right_Window = 1

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
nmap <silent> <C-F11> :cs kill -1<CR>
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
nmap <silent> <C-F5> :cs kill -1<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs add .<CR>
  \:cs reset<CR>

" Refresh ctags with Ctrl+F12
map <C-F12> <esc>:!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<cr>

" Delete spaces after each line
nmap <silent> <F2> :%s/\s\+$//g <CR>

" Tasklist configure
map <silent> <C-T> :TaskList <CR>
let g:tlTokenList = ['TODO', 'DBS', 'DBSM', 'dbs', 'dbsm']

" Auto completion via ctrl-j (instead of the nasty ctrl-x ctrl-o)
" inoremap <C-j> <C-x><C-o>
"
" Auto completion via ctrl-j using eclim (instead of the nasty ctrl-x ctrl-u)
inoremap <C-j> <C-x><C-u>

" Bufexplorer
map <silent> <C-Tab> \be

" FuzzyFinder
" map <C-@> <esc>:FufFile **\<cr>
map <silent> <C-[> :FufFile **\<cr>
map <silent> <C-\> :FufTag<cr>
" map <C-> <esc>:FufBuffer<cr>
" map <C-> <esc>:FuzzyFinderAddBookmark<cr>
" map <C-> <esc>:FuzzyFinderBookmark<cr>


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

autocmd FileType python set omnifunc=pythoncomplete#Complete

" Omnicpp's setup
set tags+=tags;    
" set tags+=C:/Program\ Files/boost\boost_1_47\boost\tags  
" set tags+=C:\MinGW\lib\gcc\mingw32\4.5.2\include\tags; 

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.c,*.h set omnifunc=omni#cpp#complete#Main

" Omni config
let OmniCpp_GlobalScopeSearch = 1  " 0 or 1  
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2  
let OmniCpp_DisplayMode = 1  
let OmniCpp_ShowScopeInAbbr = 0  
let OmniCpp_ShowPrototypeInAbbr = 1  
let OmniCpp_ShowAccess = 1  
let OmniCpp_MayCompleteDot = 1  
let OmniCpp_MayCompleteArrow = 1  
let OmniCpp_MayCompleteScope = 1 


