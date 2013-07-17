@echo off

del tags
del cscope.files
del cscope.out
del *.taghl

python get_cscope_files.py .

cscope -b -i cscope.files -f cscope.out

ctags -RV

gtags -v
