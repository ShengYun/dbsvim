" Get pathogen ready first
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Init pathogen.vim
execute pathogen#infect()

set nocompatible

" Below is customized settings
let mapleader = ","
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
nnoremap <Leader>l :
nnoremap : <Nop>

" Allow colors in commandline mode
if !has("gui_running")
    set t_Co=16
    " Color setting for terminal
    colorscheme default
else
    set t_Co=16
    " Color setting for GUI
    set background=dark
    colorscheme dbs
endif

" molokai colorscheme setup
" If you prefer the scheme to match the original monokai background color,
" put this in your .vimrc file:
let g:molokai_original = 1

" Remove menu bar and tool bar
set guioptions=

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

set wildmenu
filetype plugin indent on

" Setup fencview
let g:fencview_autodetect = 0

" Change dir to the first opening file
" and don't auto change dir ever.
cd %:p:h
set noautochdir

" disable backup and swap files
set nobackup
set noswapfile

" Ignore case sensitive
set ignorecase

" Set highlight search result
set hlsearch
nnoremap <Space> :noh<CR>

" Set search
set incsearch

" Show relative line numbers
set relativenumber

" Show line numbers
set number

" Syntax highlight setting
syntax enable
syntax on

" Set encoding to utf-8
set encoding=utf-8

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

" Map <Leader>- and <Leader>= to :colder and :cnewer
nnoremap <Leader>- :colder<CR>
nnoremap <Leader>= :cnewer<CR>

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
               \|\.obj$\|\.class$\
               \|\.png$\|\.jpg$\|\.jpeg$\|\.bmp$\
               \|\.vsd$\|\.vsdx$\|\.doc$\|\.docx$\
               \|\.xls$\|\.xlsx$',
    \ 'link': '',
    \ }

" Set this to 0 to enable cross-session caching by not deleting the cache files
" upon exiting Vim: >
let g:ctrlp_clear_cache_on_exit = 0

inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-b>"

" autocmd for vim-colors-solarized and vim-gitgutter
" This line should be removed after https://github.com/altercation/vim-colors-solarized/pull/62
" is merged into vim-colors-solarized's master.
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn

" Do not let gitgutter do the realtime update
let g:gitgutter_realtime = 0

nnoremap <leader>j :GitGutterNextHunk<cr>
nnoremap <leader>k :GitGutterPrevHunk<cr>

" neocomplcache setup
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_menu_width = 70
nnoremap <C-\> :NeoComplCacheToggle<CR>

" lock neocomplcache if writting python, jedi will take control 
autocmd FileType python execute ':NeoComplCacheLock'

" set foldmethod to indent if editing a python file
autocmd FileType python set foldmethod=indent
" set indents to 4 if editing a python file
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

" setup vim-commentary for special files
autocmd FileType python set commentstring=#\ %s
autocmd FileType kivy set commentstring=#\ %s
autocmd FileType c set commentstring=//\ %s
autocmd FileType cpp set commentstring=//\ %s

" AsyncCommand and Vim-LaTeX setup
let &grepprg = 'grep --line-number --with-filename'
" set grepprg=grep\ -nH\ $*

" Ack setup from Steve Losh
" In default, Ack will expand the word under cursor if nothing is provided.
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
let g:ack_use_dispatch = 1

" fugitive Ggrep
nnoremap <Leader>q :Ggrep <C-R><C-W>

" Vim-LaTex setup
" set shellslash
let g:tex_flavor='latex'

" jedi-vim setup
let g:jedi#usages_command = "<leader>s"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 1
" autocmd FileType python setlocal completeopt-=preview

" Don't know why this does not work with jedi-vim
" set completeopt-=preview

" UltiSnips config
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

if has("win16") || has("win95") || has("win32") || has("win64")
    let g:ycm_global_ycm_extra_conf = 'C:\Program Files\Vim\vimfiles\vimycm\ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
else
    let g:ycm_global_ycm_extra_conf = '~/.vimycm/ycm_extra_conf.py'
endif

" This is not working under Windows
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1

" YankStack Settings
let g:yankstack_map_keys = 0
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>P <Plug>yankstack_substitute_newer_paste
nnoremap <F11> :Yanks<CR>

" Syntastic settings
let g:syntastic_python_checkers = ['python', 'pep8']
let g:syntastic_c_checkers = ['gcc', 'cppcheck']
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck']

" Fuzzyfinder
nnoremap <Leader>u :FufTag<CR>
nnoremap <Leader>7 :FufFile**\<CR>

" rainbow-parentheses
nnoremap <Leader>` :RainbowParenthesesToggle<CR>
autocmd Syntax * RainbowParenthesesLoadRound    " ()
" autocmd Syntax * RainbowParenthesesLoadSquare   " []
" autocmd Syntax * RainbowParenthesesLoadBraces   " {}
" autocmd Syntax * RainbowParenthesesLoadChevrons " <>

" Manage split screens
nnoremap <Leader>1 :on<CR>
set winminheight=0
set winminwidth=0
set splitbelow
set splitright
nnoremap <Leader>z <C-W>\|<C-W>_

" <Leader>0 to <Leader>9 is reserved for other usages:)
" nnoremap <Leader>2 :call DBSOpenTerminal(['iTerm.sh'])<CR>
" nnoremap <Leader>2 :call DBSOpenTerminal(['cmd'])<CR>
" nnoremap <Leader>3 :call DBSOpenTerminal(['sh', '--login', '-i'])<CR>

" To enable YouCompleteMe
" 1) Comment let g:loaded_youcompleteme = 1
" 2) Uncomment let g:jedi#completions_enabled = 0
" 3) Uncomment g:neocomplcache_enable_at_startup = 0

let g:loaded_youcompleteme = 1
" let g:jedi#completions_enabled = 0
" let g:neocomplcache_enable_at_startup = 0

" Eclim with YouCompleteMe
" let g:EclimCompletionMethod = 'omnifunc'

" Eclim with neocomplcache
" let g:EclimCompletionMethod = 'omnifunc'

" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'

" guifont for linux
" set guifont=Monospace\ 13
" set guifont=Inconsolata:h15
" set guifont=DejavuSansMono\ 13

" guifont for mac
" set guifont=Monaco:h18
" set guifont=Inconsolata:h21
" set guifont=DejaVu\ Sans\ Mono:h20

" guifont for windows
" set guifont=Fixedsys:h12
" set guifont=Consolas:h15
" set guifont=Inconsolata:h15
" set guifont=DejaVu\ Sans\ Mono:h13
