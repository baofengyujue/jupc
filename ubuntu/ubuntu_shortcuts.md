vm运行虚拟机时如果鼠标在外面滚动了，那么焦点就返还给Windows了，此时活动窗口为vm，可通过按Windows键和alt键判断，如果焦点在vm上的话，这时鼠标悬浮在虚拟机上或者Windows上的应用都可以滚动，在哪个系统滚动一下谁就获得焦点，但是如果焦点在Windows上非vm软件上的话，那么就不能悬浮在虚拟机上滚动了，必须先vm获得焦点。
ctrl+alt+enter全屏VMware当前打开系统



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


Ubuntu系统的ctrl+alt+h/n被fcitx输入法软件拦截了，按win键，搜索fcitx configuration，点击打开，在input method选项卡一页中双击英文输入法（不是搜狗），就可看到这两个快捷键被注册了。点击快捷键的位置，键入esc就将其设为empty了（如果esc不行就用enter或者backspace）

同样ctrl+space默认被用于切换输入法了，仍然可以打开fcitx configuration，在global config选项卡一页中，就可以看到ctrl+space被注册了，点击它将其设置为ctrl+数字键盘9，就可以了，这样也不会和ctrl+9冲突(注意不要Emacs中什么快捷键都会给你拦截了，要设置切换输入法操作很复杂，Emacs就没有书写中文的命)(一般情况下不需要修改ctrl+space作为切换输入法的快捷键，要修改也是将软件中ctrl+space对应功能的快捷键改为其它的)

打开gedit，右键可以看到insert emojis选项，点击它会调出emojis选项框供输入emojis，ctrl+.也可以调出emojis选项框。


# apt vs apt-get
引用自(https://itsfoss.com/apt-vs-apt-get-difference/)



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