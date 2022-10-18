where ping
    查看ping命令的位置

mklink haha.exe F:\msys64\usr\bin\make.exe
    创建软连接为haha.exe，此软连接可以被识别为环境变量，而普通右键创建的快捷方式不行
    参考：https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/


DOSKEY aa=echo hi $1
其中$1为aa命令后面跟的第一个参数
比如aa -jkk bnm那么输出的就是hi jkk
加上$2的话应该就会输出第二个参数

下面两句注释在.bat文件会出问题，第一句注释没有问题，第二句注释会好像会把%1,%2等翻译了
应该与msys2环境集成有关
::换成rem或者@rem也是一样的
```cmd
:: $1,$2,...$*位置参数应该是Linux下的表示法，可能被msys2的环境集成影响了，cmd中用也生效
:: %1,%2,...%*本应为cmd下的，但可能被msys2环境集成影响了，这里用反而不生效
:: Update: 已经找到原因了，在doskey中的参数表示法与batch文件中表示法是分开的，详参：https://ss64.com/nt/doskey.html

@rem 照理说Windows下的命令行参数应用%1,%2...%*表示，但是这里要用$1,$2,...$*
@rem 之前怀疑是msys2影响了，后来发现把msys2的环境变量去掉了仍然是这样，使用%*的表示法反而不行
@rem 有趣的是之前注释中有%1，%2等符号时会出现问题，去掉msys2的环境变量后没问题了，
@REM 然后再次打开msys2的环境变量，打开cmd注释又出问题了；
@REM 说明msys2的环境在cmd启动时也会自动加载并解析minit.bat文件

```

## cmd的注册表设置
### 设置自动运行脚本
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor
里面的autorun一项就是


## 改变系统默认codepage
1. Go to Windows Start menu and type: Language Settings
2. Select: Administrative Language Settings
3. Select: Change system locale
4. Enable Beta: Use Unicode UTF-8 for worldwide language support
5. Click OK and restart the machine to make sure all terminals and applications get the new code page.

设置过后cl.exe编译cpp源文件时就不会有codepage的警告了
但是进行该设置后会有一些其它不舒服的地方：
- 一个就是打开cmd会默认出现all rights reserved的微软欢迎语言
  cmd可以通过在cmd快捷方式的target栏末尾给cmd.exe加上/k选项
  windows terminal可以通过改变在json文件中找到cmd.exe加上/k选项
  还有种做法就是在cmd启动文件minit.bat首部加上cls一句，不过这种做法可能具有侵略性

详参：
https://robocorp.com/docs/troubleshooting/windows-codepage
https://learn.microsoft.com/en-us/cpp/error-messages/compiler-warnings/compiler-warning-level-1-c4819?view=msvc-170


## misc
cmd中不能像Linux下一样用分号分隔，单行执行多条命令
需要使用&&

vscode里的任务的cmd参数不能使用/k，要用/c，/k会使任务结束不了

.bat文件中或cmd /c参数中不能使用DOSKEY自定义别名
参：https://superuser.com/questions/1545524/doskey-alias-command-from-a-cmd-shortcut-not-working

vs64cmd中，不要使用mc命名.bat文件，
因为存在E:\Windows Kits\10\bin\10.0.19041.0\x64\mc.exe
可以运行where mc查看命令名是否冲突

## 单双引号区别
https://stackoverflow.com/questions/51080215/differences-between-single-and-double-quotes-in-cmd


## 注释
默认cmd中没有语句中注释

下面这样都是不行的
ls rem haha
ls :: haha
只能单行注释
