" Get pathogen ready first
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Init pathogen.vim
call pathogen#infect()

set nocompatible

" Below is customized settings
let mapleader = ","
inoremap jk <Esc>
inoremap <C-C> <Nop>

" Allow colors in commandline mode
if !has("gui_running")
    set t_Co=16
    " Color setting for terminal
    colorscheme default
else
    set t_Co=16
    " Color setting for GUI
    
    " set background=dark
    " colorscheme dbs
    
    set background=dark
    colorscheme solarized
endif

call togglebg#map("<F7>")

" Remove menu bar and tool bar
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=b
set guioptions-=L

" Always show statusline
set laststatus=2

" show fencview and fugitive in statusline
set statusline=[%n]
set statusline+=%<%f%y%h%m
set statusline+=[%{&fenc!=''?&fenc:&enc}:%{&ff}]
set statusline+=%h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=\%r%=[%b\ 0x%B]
set statusline+=\ %l\ of\ %L,%c%V
set statusline+=\ Page\ %N
set statusline+=\ %P

" Setup fencview
let g:fencview_autodetect = 0

" Change dir to the first opening file
" and don't auto change dir ever.
cd %:p:h
set noautochdir

" Backup setting
set nobackup

" Ignore case sensitive
set ignorecase

" Set highlight search result
set hlsearch

" Set search
set incsearch

" Show line numbers
set number

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

" Grep config, you can setup grep's path in windows
" or just put grep in your PATH. You can find grep
" in cygwin_commands_for_windows.7z
" I changed grep.vim's grep_expr_option in grep mode
" from '--' to '' in order to input options in file list
" grep.vim version 1.9's Line 489 and Line 742
nnoremap <F3> :Grep<CR>
nnoremap <leader><F3> :GrepAdd<CR>

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
nnoremap <F12> :A<CR>

" Use F4 to call Tabbar
nnoremap <F4> :TagbarToggle<CR>

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
" Don't add other types because cscope only works with
" C, C++, and java
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win16") || has("win95") || has("win32") || has("win64")
    nnoremap <leader><F11>
                \ :AsyncCommand gfind . -iname '*.c' -exec gecho "\"{}\"" ';'
                \ -o -iname '*.cpp' -exec gecho "\"{}\"" ';'
                \ -o -iname '*.cc' -exec gecho "\"{}\"" ';'
                \ -o -iname '*.h' -exec gecho "\"{}\"" ';'
                \ -o -iname '*.hpp' -exec gecho "\"{}\"" ';'
                \ -o -iname '*.java' -exec gecho "\"{}\"" ';' > cscope.files <CR>
else
    nnoremap <leader><F11>
                \ :AsyncCommand find . -iname '*.c' -exec echo "\"{}\"" ';'
                \ -o -iname '*.cpp' -exec echo "\"{}\"" ';'
                \ -o -iname '*.cc' -exec echo "\"{}\"" ';'
                \ -o -iname '*.h' -exec echo "\"{}\"" ';'
                \ -o -iname '*.hpp' -exec echo "\"{}\"" ';'
                \ -o -iname '*.java' -exec echo "\"{}\"" ';' > cscope.files <CR>
endif

" This is for quickly updating cscope file without using GNU find
nnoremap <leader><F5> :cs kill -1<CR>
    \:!cscope -bqv<CR>
    \:cs add cscope.out<CR>
    \:cs reset<CR>

" Refresh ctags with <leader><F12>
nnoremap <leader><F12> :AsyncCommand ctags -R<cr>

" Automatically update Gtags or not
let g:Gtags_Auto_Update = 0

" Map <C-]> with :tjump
nnoremap <C-]> :tjump <C-R>=expand("<cword>")<CR><CR>

" Delete spaces after each line
nnoremap <F2> :%s/\s\+$//g <CR>

" Bufexplorer
noremap <C-Tab> :BufExplorer<CR>

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
               \|\.obj$\
               \|\.vsd$\|\.vsdx$\|\.doc$\|\.docx$\
               \|\.xls$\|\.xlsx$',
    \ 'link': '',
    \ }

" Set this to 0 to enable cross-session caching by not deleting the cache files
" upon exiting Vim: >
let g:ctrlp_clear_cache_on_exit = 0

" Omnifun's auto complete
filetype plugin indent on
set completeopt=longest,menu
set wildmenu

" ccomplete will be override by omnicppcomplete later.
set omnifunc=syntaxcomplete#Complete

" omnicomplete's shortcut
inoremap <leader>] <C-X><C-]>
inoremap <leader>d <C-X><C-d>
inoremap <leader>e <C-X><C-e>
inoremap <leader>f <C-X><C-f>
inoremap <leader>i <C-X><C-i>
inoremap <leader>k <C-X><C-k>
inoremap <leader>l <C-X><C-l>
inoremap <leader>n <C-X><C-n>
inoremap <leader>o <C-X><C-o>
inoremap <leader>s <C-X><C-s>
inoremap <leader>u <C-X><C-u>
inoremap <leader>v <C-X><C-v>
inoremap <leader>y <C-X><C-y>

inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-b>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"



" autocmd for omnicppcomplete
autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.cc,*.c,*.h set omnifunc=omni#cpp#complete#Main

" autocmd for vim-colors-solarized and vim-gitgutter
" This line should be removed after https://github.com/altercation/vim-colors-solarized/pull/62
" is merged into vim-colors-solarized's master.
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn

" Do not let gitgutter do the realtime update
let g:gitgutter_realtime = 0

nnoremap <leader>j :GitGutterNextHunk<cr>
nnoremap <leader>k :GitGutterPrevHunk<cr>
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

" neocomplcache setup
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_menu_width = 70
nnoremap <C-\> :NeoComplCacheToggle<CR>

" lock neocomplcache if writting python, jedi will take control 
autocmd BufNewFile,BufRead,BufEnter *.py execute ':NeoComplCacheLock'

" set foldmethod to indent if editing a python file
autocmd BufNewFile,BufRead,BufEnter *.py set foldmethod=indent
" set indents to 4 if editing a python file
autocmd BufNewFile,BufRead,BufEnter *.py set tabstop=4
autocmd BufNewFile,BufRead,BufEnter *.py set softtabstop=4
autocmd BufNewFile,BufRead,BufEnter *.py set shiftwidth=4

" setup vim-commentary for python files
autocmd FileType python set commentstring=#\ %s

" AsyncCommand setup
let &grepprg = 'grep --line-number --with-filename'

" jedi-vim setup
let g:jedi#usages_command = "<leader>s"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 1

" pep8 config
let g:pep8_map = "<leader>8"


" guifont for linux
" set guifont=Monospace\ 13
" set guifont=DejavuSansMono\ 13

" guifont for mac
" set guifont=Monaco:h14
" set guifont=DejaVu\ Sans\ Mono:h16

" guifont for windows
" set guifont=Fixedsys:h12
" set guifont=Consolas:h14
" set guifont=DejaVu\ Sans\ Mono:h13
