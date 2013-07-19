#!/bin/sh

rm tags
rm cscope.files
rm cscope.out
rm *.taghl

python get_cscope_files.py .

cscope -bqv

ctags -RV

gtags -v
