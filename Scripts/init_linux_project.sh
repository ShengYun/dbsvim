#!/bin/sh

rm tags
rm cscope.files
rm cscope.out
rm *.taghl

python get_cscope_files.py .

cscope -b -i cscope.files -f cscope.out

ctags -RV

gtags -v
