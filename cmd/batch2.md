You can add >nul to the end of any command to send its output to the "Null Device" so it doesn't appear on the screen.

> nul - suppress the output.

command > filename        Redirect command output to a file

   command >> filename       APPEND into a file

   command < filename        Type a text file and pass the text to command

   commandA  |  commandB     Pipe the output from commandA into commandB

   commandA &  commandB      Run commandA and then run commandB
   commandA && commandB      Run commandA, if it succeeds then run commandB
   commandA || commandB      Run commandA, if it fails then run commandB

   commandA && commandB || commandC
                             If commandA succeeds run commandB, if it fails commandC

Creating a new file
Create empty files using the NUL device:

Type NUL >EmptyFile.txt
or 
Copy NUL EmptyFile.txt

To prevent the > and < characters from causing redirection, escape with a caret: ^> or ^<

Redirect multiple lines by bracketing a set of commands:

(
  Echo sample text1
  Echo sample text2
) > c:\logfile.txt



"D:\ProgramFiles\Typora\Typora.exe" %1
start %1
上面两句对于xx.bat aa.md作用一样
start xx使用默认程序打开xx文件