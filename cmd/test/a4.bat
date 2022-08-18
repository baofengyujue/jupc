@echo off
rem /a表示右侧为可求值的表达式
set /a counter=2*3
set /a result=(%counter%-1)*2
echo %result%
echo result
set /p uinput="enter: " & echo %uinput%

echo --------------------
rem unlike most of Windows, variables are case-dependent
rem The variable letter is preceded with a single percent sign when using the command line directly or double percent signs in a batch file

for %%x in (aa bb cc) do echo %%x
echo --------
for %%x in (aa bb cc) do (echo %%x)
rem As always, keep in mind that the command line may choke on file names with spaces unless the name is enclosed correctly in quotes. Therefore, you might want to use "%%X" in the "command" section.
rem "command" section也就是do后面的部分
for %%x in (aa bb cc) do (echo "%%x")
echo --------
for /l %%x in (1,2 ,10) do echo %%x
pause