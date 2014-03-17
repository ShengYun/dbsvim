# Sheng Yun's vim config

This repo uses pathogen to manage my vim plugins

To manual install, see contents of either **update-mac-linux-vim.sh**
or **update-windows-vim.bat**

## Install/Update
1. git clone https://github.com/ShengYun/dbsvim.git
2. cd dbsvim
3. git submodule update --init --recursive

### Linux/MacOSX
- run update-mac-linux-vim.sh

### Windows
- run update-windows-vim.bat

## Dependency
If using Windows, stuff in **windows\_utility** may be useful.

To enable YouCompleteMe, first comment out *let g:loaded_youcompleteme = 1*, and uncomment *let g:neocomplcache_enable_at_startup = 0* below. Then follow the YouCompleteMe install intructions [here][1]. A handy script is in *ycm_build_mac_linux*.

- ack
- ag (the_silver_searcher)
- cscope
- ctags
- dejavu fonts
- git
- gnu global (gtags)
- whatever static checker you are using and supported by syntastic
- python 2.7+ (if you only have python 2.6, you should install the argparse module)
- YouCompleteMe dependencies(optional)
- Eclim(optional)

    [1]: https://github.com/Valloric/YouCompleteMe
