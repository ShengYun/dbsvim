@echo off

del tags
del cscope.files
del cscope.out
del *.taghl

python get_cscope_files.py .

cscope -bqV

ctags -RV

gtags -v
