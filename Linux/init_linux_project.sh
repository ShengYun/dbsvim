#!/bin/sh

rm tags
rm cscope.files
rm cscope.out
rm *.taghl

find . -iname '*.c' -exec echo "\"{}\"" ';' ^
-o -iname '*.cpp' -exec echo "\"{}\"" ';' ^
-o -iname '*.cc' -exec echo "\"{}\"" ';' ^
-o -iname '*.h' -exec echo "\"{}\"" ';' ^
-o -iname '*.hpp' -exec echo "\"{}\"" ';' ^
-o -iname '*.java' -exec echo "\"{}\"" ';' ^
-o -iname '*.php' -exec echo "\"{}\"" ';' ^
-o -iname '*.pl' -exec echo "\"{}\"" ';' ^
-o -iname '*.py' -exec echo "\"{}\"" ';' > cscope.files

cscope -b -i cscope.files -f cscope.out

ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .
