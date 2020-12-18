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
alt+b/f 向前/向后移动一个词

Delete from the cursor to the beginning of the line.
Ctrl+u
Delete from the cursor to the end of the line.
Ctrl+K

Delete from the cursor to the start of the word.
Ctrl+W
Delete previous word
Esc+Del or Esc+Backspace

Move to the start of the line
Ctrl+A
Move to the end of the line
Ctrl+E



------

自定义：
$ gsettings get org.gnome.desktop.wm.preferences mouse-button-modifier
termianl->menubar->edit->profile preferences->command->run command as a login shell(加sudo不生效,勾选了过后不需要重新打开终端,立即生效的,完成过后回来取消勾选了,并不是一次性的)
$ gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'


settings->keyboard->shortcuts->navigation->scroll to bottom->switch to workspace left/right/above/below

