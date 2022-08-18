@echo off
if 22 gtr 11 echo greater
echo -------
echo aa
goto :zz
echo bb
echo cc
:zz
echo dd
rem 延时
timeout /t 2 > nul
rem 执行到文件尾,也就相当于退出脚本执行了
if 22 gtr 11 goto :eof
echo -------
echo haha
pause