if has("win16") || has("win95") || has("win32") || has("win64")
    let g:ycm_global_ycm_extra_conf = 'C:\Program Files\Vim\vimfiles\vimycm\ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
else
    let g:ycm_global_ycm_extra_conf = '~/.vimycm/ycm_extra_conf.py'
endif

" Don't know why this is not working, will fix later
" let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'python' : 1,
      \}

