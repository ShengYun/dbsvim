#!/bin/sh

rm tags
rm cscope.files
rm cscope.out
rm *.taghl

python get_cscope_files.py .

cscope -bqV

ctags -RV

gtags -v
