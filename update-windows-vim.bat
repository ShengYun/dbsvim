rmdir /S /Q "C:\Program Files\Vim\vimfiles\bundle"
del "C:\Program Files\Vim\_vimrc"
copy vimrc "C:\Program Files\Vim\_vimrc"
xcopy /S /E /H bundle "C:\Program Files\Vim\vimfiles\bundle\"
