where ping
    查看ping命令的位置

mklink haha.exe F:\msys64\usr\bin\make.exe
    创建软连接为haha.exe，此软连接可以被识别为环境变量，而普通右键创建的快捷方式不行
    参考：https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/


DOSKEY aa=echo hi $1
其中$1为aa命令后面跟的第一个参数
比如aa -jkk bnm那么输出的就是hi jkk
加上$2的话应该就会输出第二个参数