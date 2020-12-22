vm运行虚拟机时如果鼠标在外面滚动了，那么焦点就返还给Windows了，此时活动窗口为vm，可通过按Windows键和alt键判断，如果焦点在vm上的话，这时鼠标悬浮在虚拟机上或者Windows上的应用都可以滚动，在哪个系统滚动一下谁就获得焦点，但是如果焦点在Windows上非vm软件上的话，那么就不能悬浮在虚拟机上滚动了，必须先vm获得焦点。




hold super---show "Keyborad Shortcuts"(showed almost all usual)
alt+f1---focus to taskbar,use up/down key to navigate左侧任务栏
alt+f2---run a command(in dash panel)
super---open dash panel
ctrl+tab(after press super dash panel showed)---switch dash panel(app/file/video...)
super+a/f/v/m/c---open app/file/video/music/camera pane in dash panel

print---默认没有设置为截屏，可在快捷键设置中的screenshot中查看是否启用
alt+print---take a screenshot of active window
shift+print---take a screenshot of an area
ctrl+print---copy a screenshot to clipboard
ctrl+alt/shift+print---copy a screenshot of active window/an area to clipboard
ctrl+alt+print---take a screenshot to vmware

ctrl+alt+delete---log out
ctrl+alt+l---lock screen

super+space---switch to next source切换到下一个输入法
ctrl+alt+numpad5---toggle maximization state
alt+f7/f8---move/resize window

alt+leftMouse drag---move window后面会自定义设置为win+leftMouse drag

type letters in file explorer/desktop to quick navigate快速查找

settings->keyboard->shortcuts

### nautilus ubuntu file explorer:

ctrl+1---file showed in list view
ctrl+2---file showed in icon view
ctrl+q---close the explorer window
behaves like browser:
ctrl+t---open a new tab(like in browser,but this is in file explorer)
ctrl+w---close tab
ctrl+d---bookmark this location
ctrl+b--show bookmarks
ctrl+l--goto inputed location
alt+enter--properties
ctrl+n--new explorer window
ctrl+shift+n--new file folder
make link--ctrl+m
reload(refresh)--ctrl+r
select items matching inputed pattern--ctrl+s
inverse select--ctrl+shift+i
show hidden files--ctrl+h
hide sidebar--f9
alt+up/backspace--like in windows,goto upper location
alt+left/right--go back/forward
open in new tab/window--ctrl+shift+t/o
f2--rename(像windows一样的延迟点击不能重命名)
...
查看菜单栏的每个菜单项，就可以看到其命令的快捷键
按f1就可以浏览到所有的帮助细节


一个应用有多个实例时，任务栏点击该应用图标会使最近使用的实例窗口还原（假若隐藏），再点击一下该应用图标则展开该应用的所有实例，等同于ctrl+super+w

### terminal:

menubar->terminal->preferences->shortcuts选项卡
ctrl+shift+c/v---copy/paste(not ctrl+c/v)
ctrl+l---clear
ctrl+shift+t---new terminal tab
ctrl+d---close terminal tab
ctrl+r---search the command in command history
ctrl+a/e---caret move to line beginning/end
ctrl+c---stop current task
ctrl+z---put current task in background(same as command end with &)


ctrl+d---close terminal tab已经无效
已经变成删除光标字符了，同del作用一样



Ctrl+G: Leave history searching mode without running a command.用ctrl+r查找指令了的话，按esc退出来会把查找到的指令放在命令行，按ctrl+g退出的话就不会
ctrl+y粘贴刚刚ctrl+w或ctrl+u/k的内容，若最近的ctrl+w是连续的（中途没进行任何其它键盘操作如插入字符或者移动光标等），则会粘贴连续ctrl+w的内容。（注：ctrl+y不是粘贴剪贴板也就是ctrl+shift+c的内容）
ctrl+h作用同backspace
ctrl+j作用同enter
ctrl+m作用同enter
ctrl+i搜索光标前所有字符除空格组成的文件名的文件
Alt+R: Revert any changes to a command you’ve pulled from your history if you’ve edited it.使用上下键或者ctrl+p/n回溯历史指令的时候，如果对历史做了更改（比如插入字符或修改），那么在回溯到那条历史的时候按alt+r就可以一步恢复为最初的历史。（注：如果回溯到某条历史指令做了更改然后enter执行了的话，这时就创造了新的一条历史指令，原历史指令并未改变）
ctrl+r进入搜索历史指令模式，输入要搜索的字符
Alt + d   Delete the Word after the cursor.

ctrl+t替换光标字符和光标前一字符位置，然后光标移到下一位；如果光标在行首则无法执行此指令，若光标在行尾则替换行尾两个字符
Alt + t   Swap current word with previous

Alt + u   UPPER capitalize every character from the cursor to the end of the current word.
  Alt + l   Lower the case of every character from the cursor to the end of the current word.

ctrl + shift+-也就是ctrl+_  Undo撤销
Ctrl+v tells the terminal to not interpret the following character, so Ctrl+v Ctrl-I will display a tab character,
similarly Ctrl+v ENTER will display the escape sequence for the Enter key: ^M，连续按ctrl+v ctrl+i会得到制表符tab，按ctrl+v enter会得到^M，按ctrl+v ctrl+3会得到^[等等
ctrl+s Stop output to the screen (for long running verbose commands).
            Then use PgUp/PgDn for navigation.当有指令在运行中时是阻止指令输出(没有指令在运行中的话就是阻止输出，就是按任何键都没输出除了ctrl+q或者ctrl+c，见ctrl+q指令)
Ctrl + q当有指令在运行中时是Allow output to the screen，如果之前有被ctrl+s阻止过的话（ctrl+s阻止输出过程中在shell中输入字符按ctrl+q结束的话，会输出到命令行，ctrl+c结束的话即杀死了进程，中途输入的字符也会丢掉）
ctrl+o不要使用这个快捷键，因为其行为很复杂而且没什么用

无效果的快捷键记录：
ctrl+v无效果，连续两次ctrl+v则会打印^V

### like windows:

alt+f4
alt+space
alt+tab
win+1,2,3...
f2


alt需要长按才会显示快捷字符

### launcher

super(hold)---快捷键一览
alt+f1
super+tab---与Windows不同，按住super不断tab是在任务栏中的应用图标之间切换，松开打开应用
super+1 to 9
super+shift+ 1 to 9打开新实例
super+t打开trash bin垃圾箱

### dash

(就是按了super之后弹出的透明框，dash面板作用类似Windows的开始菜单)
super(tap)
super+a/f/m/c/v
ctrl+tab
arrow keys切换呗

### hud & menu bar

alt(hold)
alt+f10打开应用第一个状态栏菜单
cursor left/right
alt+printscr

### switching

alt+tab
alt+`同一个应用的不同实例之间切换
cursor left/right
cursor up/down
alt+q在用alt+tab/alt+`切换的过程中关闭切换到的实例

### windows

super+w展开所有已经打开的窗口，最小化的不会展示
ctrl+super+w展开活动窗口应用所有实例，最小化了也会展示
ctrl+super+d和Windows的win+d作用相同，再按一次又显示
ctrl+super+up/down/left/right和Windows的win+u/d/l/r作用相同（全屏，还原/最小化，左分屏，右分屏）
alt+f4
alt+space
ctrl+alt+num(keypad)作用和Windows的4角分屏类似，甚至更强大（1,2,3下半屏的左屏，全屏，右屏4,5,6全屏的左屏，全屏，右屏6,7,8上半屏的左屏，全屏，右屏）
alt+leftMouse drag



------

ctrl+alt+t打开terminal，再按f1打开帮助，查看keyboard shortcuts

ctrl+shift+=/ctrl+-/ctrl+0 放大/缩小/还原内容字体（nautilus也适用）

ctrl+shift+t 新开一个标签页
ctrl+shift+n 新开一个terminal窗口
ctrl+shift+w/q 关闭标签页/窗口
alt+1/2/3... 打开对应的标签页

ctrl+shift+up/down 上下滚动一行
shift+pageup/pagedown 上下滚动一页

ctrl+l/输入clear 清屏


shell的快捷键，不是terminal的
Bash shell specific keyboard shortcuts are:

ctrl+b/f/p/n 相当于left/right/up/down(back/forward/previous/next)
alt+b/f 光标向前/向后移动一个词

Delete from the cursor to the beginning of the line.
Ctrl+u
Delete from the cursor to the end of the line.
Ctrl+K
Ctrl+K(也就是Ctrl+Shift+k)和Ctrl+k不一样都是删除到行尾么？(待验证)

Delete from the cursor to the start of the word.
Ctrl+W
Delete previous word
Esc+Del or Esc+Backspace

Move to the start of the line
Ctrl+A
Move to the end of the line
Ctrl+E


从ctrl+w的例子中可以看出ubuntu_shortcuts.md中ctrl+w和ctrl+W是一样的，也就是文中快捷键不区分大小写，ctrl+W并不代表ctrl+shift+w，大小写为小写的只是个别搞忘了


------

自定义：
$ gsettings get org.gnome.desktop.wm.preferences mouse-button-modifier
termianl->menubar->edit->profile preferences->command->run command as a login shell(加sudo不生效,勾选了过后不需要重新打开终端,立即生效的,完成过后回来取消勾选了,并不是一次性的)
$ gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'


settings->keyboard->shortcuts->navigation->scroll to bottom->switch to workspace left/right/above/below




--------

对于"hello world"，
如果此时光标在第一个l处，那么执行
w:光标会挪到w位置
e:光标会挪到o位置
b:光标会挪到h位置

w为，光标移动到下个单词首字母
e为，光标移动到光标处单词词尾字母（如果光标已经在词尾或者在空格处，那么就跳到下一个单词词尾）
b为，光标移动到光标处单词词首字母（如果光标已经在词首或者在空格处，那么就跳到上一个单词词首）

w:move to the next word
e:move to the end of the word
b:move to the beginning of the word

w,e,b都将符号等作为单词分界
W,E,B都只以空格或换行符作为单词分界

可以以下文本导航观察效果：
"there're--some...words  first... sentence
   second-line  ...second  sentence.
third line."

对于含有中英文，中英文符号（数字相当于英文字母）的混合文本来说，
中文，英文，中英文符号，这三种文本各成一派（注意中英文符号是一派的），
光标从这三派其中一派切换到另一派时
都会使w导航（包括e,b等训词导航）时光标停下来，只有空格和换行不会使训词导航停下来
这时对于W来说，其仍然只以空格或换行作为单词分界

混合文本可以以下文本导航观察效果：
"你好hello123  world123世界，，,,..。。这个世界123...123真的really会好吗
    我不知道know
third line."



插入模式就是，如果光标在a字符处闪烁，那么输入字符就会出现在a字符前面，此时光标还在a上闪烁，
但退出插入模式过后，光标就向前挪动一位到a前一字符上了

末行模式就是以冒号:起首开始输入指令的模式
命令模式就是插入模式时用esc退出过后的模式，此时可以使用比如键入x删除光标处字符的一些命令