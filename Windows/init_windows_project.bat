del tags
del cscope.files
del cscope.out
del *.taghl

rem note that gfind is actually cygwin's find
rem and gecho is actually cygwin's echo
rem you can find these in cygwin_commands_for_windows.7z

gfind . -iname '*.c' -exec gecho "\"{}\"" ';' ^
-o -iname '*.cpp' -exec gecho "\"{}\"" ';' ^
-o -iname '*.cc' -exec gecho "\"{}\"" ';' ^
-o -iname '*.h' -exec gecho "\"{}\"" ';' ^
-o -iname '*.hpp' -exec gecho "\"{}\"" ';'^
-o -iname '*.py' -exec gecho "\"{}\"" ';' > cscope.files

cscope -b -i cscope.files -f cscope.out

ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .
