@echo off
rem 切换为utf8
rem chcp 65001
rem 切换回默认,也就是gbk
rem chcp 936
set aa=hello world
echo %aa%
rem 输出换行,注意这里.要紧跟
echo.
rem 连续两行含中文的注释会报错,所以这里空出来了一行

rem 或者合并到一行

rem 这应该和cmd的字符编码等有关系,因为这里好像是rem注释了自己,而后面的中文字符却当作命令

rem 不过在注释末尾加上某些符号就可以了,比如分号,逗号,比如这样,
rem 经测试,只要一个文档中第一处连续注释的第一个注释末尾有个逗号就可以了
rem 或者每一个连续注释中第一个注释末尾有个逗号就可以了
rem 反正有乱码加个逗号就可以了

%这也能当作注释?答案是,是的%

rem 这条语句不能在命令行中输入执行,
rem 需在文件中
if exist a1.bat echo a1.bat exist

if not exist a1.bat echo a1.bat not exist

rem 判断变量是否存在
if defined aa echo variable exist
rem 不能为这样
if defined %aa% echo variable exist

pause