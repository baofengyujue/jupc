# 读前须知
- 本文是在系统`Ubuntu 20.04.1 LTS`下测试编写的，如果是其它Linux环境可能行为会有不同

# 目录
- [读前须知](#读前须知)
- [目录](#目录)
- [关于terminal,shell,bash](#关于terminalshellbash)
- [terminal快捷键：](#terminal快捷键)
- [bash快捷键](#bash快捷键)
  - [命令编辑模式切换：](#命令编辑模式切换)
  - [默认emacs编辑模式下：](#默认emacs编辑模式下)
    - [快捷键](#快捷键)
    - [emacs编辑模式下esc等效命令：](#emacs编辑模式下esc等效命令)
    - [emacs编辑模式下其它说明：](#emacs编辑模式下其它说明)
    - [emacs编辑模式下助忆全名](#emacs编辑模式下助忆全名)
  - [!相关命令：](#相关命令)
  - [bash之vi编辑模式：](#bash之vi编辑模式)
    - [可以使用的：](#可以使用的)
    - [不能用的：](#不能用的)
    - [其它说明：](#其它说明)
- [本文部分引用/参考自：](#本文部分引用参考自)

# 关于terminal,shell,bash
引用自[terminal-shell-and-bash](https://medium.com/@krish.raghuram/terminal-shell-and-bash-3e76218c8865)

We have all heard of terminal, shell, bash etc. in Linux. Are they all the same? 
Do they differ in any important way? Lets have a look!

- The `terminal` is the GUI window that you see on the screen. It takes commands and shows output.
- The `shell` is the software that interprets and executes the various commands that we type in the terminal.
- `Bash` is a particular shell. It stands for Bourne Again Shell. Some other examples of shell are sh(bourne shell), csh(c shell), tcsh(turbo c shell) etc.
- `CLI`(Command Line Interface) refers to a user interface in computers where users type in commands and see the results printed on the screen.

> 本文大多数时候没有区分shell和terminal，如有区别会特别强调。


# terminal快捷键：
```
ctrl+alt+t  打开terminal，再按f1打开帮助，查看keyboard shortcuts

ctrl++/ctrl+-/ctrl+0    放大/缩小/还原，terminal中文本字体（nautilus也适用）
                        （ctrl++即ctrl+shift+=）

ctrl+shift+t    新开一个标签页
ctrl+shift+n    新开一个terminal窗口，相当于ctrl+alt+t
ctrl+shift+w    关闭标签页(如果没有其它标签页则为关闭窗口)
ctrl+shift+q    关闭terminal窗口(所有标签页都会关闭)
alt+1/2/3...    打开对应的标签页

ctrl+shift+up/down      上下滚动一行
shift+pageup/pagedown   上下滚动一页

ctrl+小写L/输入clear    清屏(如果bash在vi编辑模式下，
                            则快捷键<ctrl+小写L>默认只在命令模式时生效)
```



# bash快捷键
## 命令编辑模式切换：
```
set -o vi       将bash命令的编辑模式设为vi
set -o emacs    将bash命令的编辑模式设为emacs(默认编辑模式)
```
- 在terminal中执行上述命令只会在当前terminal生效，要想在所有terminal中都默认生效，须在~/.bashrc文件中添加上述命令
- 作为一个vim编辑器使用者，bash设为vi编辑模式就可以了。emacs快捷键基本上没有什么是值得去记忆的:-)



## 默认emacs编辑模式下：

-----------------------------------------------------------------------------

### 快捷键
```
ctrl+r      进入搜索历史指令的模式，之后输入要搜索的历史指令中所包含的字符
            注意(reverse-i-search)`xxx':，其中`'中的xxx才是输入搜索的字符，冒号:后面是搜索结果。
            连续按ctrl+r可不断在历史指令中往前搜索查找字符。注意不能用上下键等方式导航查询结果，
            向前或向后搜索为不断按ctrl+r或ctrl+s。注意默认ctrl+s按键被terminal拦截，
            需要先进行设置，见下面ctrl+s

ctrl+s      与ctrl+r功能相同，只不过搜索的方向为向后搜索。
            在向前或向后搜索过程中，都可以按另外一个快捷键切换方向搜索。

            按ctrl+s前需要注意，很多terminal把ctrl+s快捷键拦截作为阻止屏幕输出的快捷键了，
            如果很少用到，可以在terminal中输入下面指令取消在当前terminal对ctrl+s的拦截：
            stty -ixon
            可以将该命令添加到~/.bashrc文件中，使在所有terminal中都不对ctrl+s进行拦截

ctrl+g      Leave history searching mode without running a command.
            此快捷键要在使用ctrl+r查找指令过后才能使用
            用ctrl+r查找指令过后，按esc退出来会把查找到的指令放在命令行，但按ctrl+g退出的话就不会

ctrl+o      Execute the command found via Ctrl+r or Ctrl+s

ctrl+s      terminal默认对ctrl+s进行拦截的时其功能为：
            Stop output to the screen (for long running verbose commands).
            Then use PgUp/PgDn for navigation.当有指令在运行中产生很多输出时，阻止指令再向terminal输出。
            (没有指令在运行中的话，就是阻止输出，即按任何键都没输出，除了ctrl+q或者ctrl+c，见ctrl+q指令)
            关于修改terminal对ctrl+s拦截的行为，见上文搜索命令中的ctrl+s

ctrl+q      当有指令在运行中时是Allow output to the screen，如果之前有被ctrl+s阻止过的话
            （ctrl+s阻止输出过程中，在shell中输入的字符，回车等在按ctrl+q结束阻止输出后，
            会全部一起输出到命令行，ctrl+c结束的话，因为杀死了进程，中途输入的字符，回车等会丢掉）

ctrl+y      粘贴最近一次复制的内容（ctrl+u/k/w,alt+d等命令会复制内容）
            （注：ctrl+y不是粘贴系统剪贴板即ctrl+shift+c复制的内容）
            （如果连续执行ctrl+w命令，则ctrl+y粘贴的是这几次ctrl+w所复制的内容的总和）

alt+y       在ctrl+y粘贴后，从剪贴板历史中粘贴往前一项
            （注：需要先执行ctrl+y，否则没有效果）

ctrl+d      相当于del
ctrl+h      相当于backspace
ctrl+j      相当于enter
ctrl+m      相当于enter


ctrl+i      搜索光标前所有字符除空格组成的文件名的文件

alt+r       Revert any changes to a command you’ve pulled from your history if you’ve edited it.
            使用上下键或者ctrl+p/n回溯历史指令的时候，如果对历史做了更改（比如插入字符或修改），
            那么在回溯到那条历史的时候按alt+r就可以一步恢复为最初的历史指令。
            （注：如果回溯到某条历史指令做了更改然后enter执行了的话，
            这时就创造了新的一条历史指令，原历史指令并未改变）

alt+b/f     光标向前/向后移动一个词，相当于ctrl+左右键
ctrl+b/f    光标向前/向后移动一个字符，相当于左右键
ctrl+p/n    上一条/下一条历史指令，相当于上下键

ctrl+u      Delete from the cursor to the beginning of the line.(会复制)
ctrl+k      Delete from the cursor to the end of the line.(会复制)

ctrl+w      Delete from the cursor to the beginning of the word.(会复制)
alt+d       Delete from the cursor to the end of the word.(会复制)

ctrl+a      Move to the start of the line(行首)
ctrl+e      Move to the end of the line(行尾)

ctrl+t      Swap current character with previous
            (然后光标移到第二个字符后一位)

alt+t       Swap current word with previous
            (然后光标移到第二个单词末尾后一位)

alt+u       UPPER the case of every character from the cursor to the end of the current word.
alt+l       lower the case of every character from the cursor to the end of the current word.
alt+c       大写化单词光标处后的字符，只大写第一个字符，后面字符都被小写化

ctrl+_      Undo撤销(即ctrl+shift+-)

alt+<       Jump to the beginning of the history(即alt+shift+,)
            (most distant最早的第一条历史指令)

alt+>       Jump to the end of the history(即alt+shift+.)
            (most recent最近的一次指令，包括正在编辑还未回车的指令)

ctrl+],x        x为任意字符，在当前行，光标移动到下一处x字符出现处
ctrl+alt+],x    x为任意字符，在当前行，光标移动到上一处x字符出现处


ctrl+g      终止命令，例如输入了ctrl+]还需要输入查找字符才行，这时可以按ctrl+g终止ctrl+]命令

alt+\       删除光标处及两边的空格和tab

ctrl+x,(    开始录制键盘宏，即录制向键盘输入的所有
ctrl+x,)    结束录制键盘宏
ctrl+x,e    应用上一次录入的键盘宏
            (即重新再输入一遍在录制宏期间输入的所有命令，包括输入字符，回车等)

ctrl+@      光标处设置标记
            （设置标记了不能像emacs一样进行选区，
            只能用于与ctrl+x,ctrl+x配合进行光标位置切换）

ctrl+x,ctrl+x   光标在在当前位置与ctrl+@设置的标记位置间切换
                （如果ctrl+@设置标记了之后，
                有ctrl+w或alt+d等编辑操作，那么之前设置的标记会失效）

```

### emacs编辑模式下esc等效命令：
```
esc指令行为：
例如对于指令esc+b可以是：
- 按了esc再按b
  (alt+b不可以，按了alt再按b只会输入b字符)
- 按住esc和b，但中途需抬起esc键再按esc和b，不能按住esc连续按b
  (alt+b可以，按住alt键然后再连续按b)


esc,按键    相当于alt+按键

esc,f/b     相当于alt+f/b

esc,ctrl+h  相当于alt+ctrl+h或ctrl+w
esc,d       相当于alt+d

esc,<       相当于alt+<
esc,>       相当于alt+>

tab         Try to finish the text(查找路径下的命令，文件名等)
esc,tab     Attempt the completion from previous commands in the history list
esc,?       List all the possible completions

esc,/       Attempt the filename completion
esc,!       Attempt the command completion
ctrl+x,/    List the possible filename completions
ctrl+x,!    List the possible command completions
            注意Attempt和List是不同的，
            Attempt会在只有一个侯选项时自动输入该候选项，List则不会。

esc,u       相当于alt+u
esc,l       相当于alt+l
esc,c       相当于alt+c

esc,backspace   相当于alt+backspace或ctrl+w
esc,d           相当于alt+d或ctrl+del

```


### emacs编辑模式下其它说明：
```
少用的快捷键：
ctrl+v      tells the terminal to not interpret the following character, 
            Add the next character typed to the line verbatim.
            就是说下一个输入字符会原样输入，不会被当作命令。比如ctrl+v后输入ctrl+w就会输入^w，
            而不是被shell转义的命令，即删除前面一个单词的意思。
            但很多按键没有转义时输入的字符很奇怪，如按ctrl+v ctrl+i会得到制表符tab，
            按ctrl+v enter会得到^M，按ctrl+v ctrl+3会得到^[等等

alt+p/n     非incremental搜索，即只向前或向后搜索一次，不能连续搜索
            (冒号后输入了指令包含的字符后还需回车，才会把该条指令输入到terminal)


效果相同的命令：
ctrl+k与ctrl+shift+k
alt+u/l与alt+shift+u/l
ctrl+d与ctrl+shift+d
ctrl+backspace与backspace
ctrl+_与ctrl+x,ctrl+u


其它地方可能可以，但Ubuntu2020下的terminal不可以的命令：
esc,del其它地方等价于esc,backspace
alt+del其它地方和emacs中为删除前一单词


terminal与emacs编辑器不同的快捷键：
ctrl+u在emacs下不行，emacs下没反应
ctrl+w在emacs下不是删除前一单词，emacs下为删除到标记处的内容
ctrl+backspace在terminal下相当于backspace，emacs下为删除前一单词
alt+del在terminal中为输入~，在emacs下为删除前一单词
- 这些terminal与emacs编辑器有区别的快捷键说明这些快捷键是属于terminal的，
  也就代表这些快捷键在bash的emacs和vi编辑模式下都能使用
```

### emacs编辑模式下助忆全名
```
ctrl+y(yank back)
ctrl+s(incremental search)
ctrl+r(reverse incremental search)
ctrl+s(stop output)
ctrl+q(quit stop output)
```


## !相关命令：

-----------------------------------------------------------------------------

> !相关命令在emacs模式和vi模式都可以使用
```
!!          执行上一次执行的命令
            （执行之后使用ctrl+p/n或上下键回溯历史，
            仍会把原指令输入到terminal，而不是!!）

!n          执行命令历史中第n项命令
            (可以在terminal中输入history回车看到命令历史和命令的序号)
!-n         执行命令历史中从后往前第n项命令

!:i         执行上一命令的第i个参数
            （比如上一命令为xx a b，那么执行!:0就为执行xx，执行!:2就为执行b）
            （如果范围输入超出或错误会出现bad word specifier的提示）
!:i-j       执行上一命令的第i到第j个之间的参数
            （比如上一命令为xx a b c，那么执行!:0-2就为执行xx a b）
!:i-$       执行上一命令的第i个到末尾之间的参数

!n:i        上面参数范围限定用法都可以接在历史命令后，
            表示对该历史命令的参数范围限定
!-n:i-j

!$          执行上一命令的最后一个参数
            （比如上一命令为xx a b c，那么执行!$就为执行c）
alt+.       输入上一命令最后一个参数

!*          执行上一命令的所有参数
            （比如上一命令为xx a b c，那么执行!*就为执行a b c，
            注意第一个xx不算参数，虽然!:0访问得到它）
            （输入!*,!$等命令不一定是执行，按了回车才是执行，其本意为代表相应命令，
            比如上一命令为xx a b，那么执行yy !*就为执行yy a b）

!n:p        在terminal打印!n代表的历史命令

!n:i:p      上面命令都可以接:p打印所表达的命令
!-n:i-j:p

^abc^xyz    键入^abc^xyz回车，将上一命令中的abc替换为xyz并执行
            (比如上一命令为xx a b c，那么执行^b^b2就为执行xx a b2 c)
```


## bash之vi编辑模式：

-----------------------------------------------------------------------------

- 一般的移动，和编辑命令还有接量词和组合命令都没问题
- 关于行的命令如J,o,>>,yk等和一些高级操作如可视模式，分屏，记录宏等都没法用
- !相关命令没问题

### 可以使用的：
> 下面都是没问题的（有的命令后面只是没有写没问题）
```
在插入模式时上下键回溯历史指令后还是处于插入模式中
在命令模式时上下键或j,k回溯历史时也还是处于命令模式中

space
i,I,a,A没问题
hjkl没问题
0,$,^
2|
100G从命令history中输入序号100的历史命令
w,b,e
w/b/e和W/B/E行为和vim一致
%
fx/Fx和;和,没问题
ma,`a做标记没问题
x
s
r
R
y/d/c
D/C
dd,yy,cc
dw,yw,cw
dw,d$没问题
~
p
u
.
3dw或d3w没问题（注意输入了量词后，命令行会出现(arg: 3)的提示）
3w,3b,3e
3x
3~
3p
3u
3.
3yl/yh

大写U相当于emacs编辑模式中的alt+r，
但alt+r在vi模式中不能用
(alt+r在插入模式和命令模式都不能用，所以只能用U)

/和?和n/N没问题

插入模式时和vim一样可以使用ctrl+u和ctrl+w等emacs命令
```

### 不能用的：
```
末行模式不行

分屏不行

backspace不能移动光标，按了没反应
o,O,J不能用

ctrl+r不为重做，其功能为搜索，参考emacs编辑模式下的解释
搜索相关的ctrl+s和ctrl+g都不能用

``不能与标记之间来回跳转

daw,yaw,caw含a的都不行

v进入nano编辑器编辑本行命令
V和ctrl+v都没反应

Y不行

K不行

yj,yk不行

>>,<<不行，没反应
*/#不行，#变为注释本行命令了

"xy不行，不能注册复制内容

qx不行，不能记录宏
```

### 其它说明：
`ctrl+小写L`清屏默认只在命令模式下可以用，
但可以通过向`~/.bashrc`文件中添加如下命令，使其在插入模式时也可以使用：
```
bind -m vi-insert "\C-l":clear-screen
```




# 本文部分引用/参考自：
- [How To Use Bash History Commands and Expansions on a Linux VPS](https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps)
- [How-to: Bash Keyboard Shortcuts](https://ss64.com/osx/syntax-bashkeyboard.html)
- [Which emacs shortcuts are useful in bash? \[closed\]](https://superuser.com/questions/352983/which-emacs-shortcuts-are-useful-in-bash/352991)
- [readline-emacs-editing-mode-cheat-sheet](https://catonmat.net/ftp/readline-emacs-editing-mode-cheat-sheet.pdf)
- [clear-your-terminal-screen](https://www.linux.org/threads/clear-clear-your-terminal-screen.78/)