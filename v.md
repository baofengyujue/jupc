# 读前须知
- ctrl+w,q等价于:q(ctrl+w了再按q,ctrl+w->ctrl+q没有反应)
- shell即是Ubuntu/Linux中的命令行，命令行窗口在Ubuntu/Linux中称为terminal，terminal和shell的区别在于如果是在服务器输入命令就处在shell之中，因为服务器操作没有图形界面，所以就没有terminal
- 删除并复制即为剪切


- vim笔记中，字母大小写是否为shift加字母要说明
- 文中许多符号加命令的方式要在文章开头做出说明，说明本文的表达方式，不然读者会搞不清经常，比如"+c/d/y表示shift加逗号过后键入c或d或y
- 文中的d应该是剪切而不是删除，注意说明
文中说明d(delete)的时候，删除并复制，加上一句相当于剪切
文中的删除并复制是否能改为剪切
- 表示或的斜杠符号/，的两边选项和前文相连，容易造成歧义或误解，多使用标点符号或分隔符
- 注意句首与行首的区别


# 模式切换

## 处在命令模式时，可以输入：

```
i       进入"插入模式"  可在左下角看到 -- INSERT -- 标识
R       进入"替换模式"  可在左下角看到 -- REPLACE -- 标识
:       进入"末行模式"  可在左下角看到冒号 : 出现
/       进入"搜索模式"  可在左下角看到斜杠 / 出现
```

- 进入到上面任何一种模式后都可以按<kbd>Esc</kbd>或<kbd>ctrl+[</kbd>或<kbd>ctrl+c</kbd>回到命令模式
- 其中进入`末行模式`或`搜索模式`后，都还需要输入额外指令才能执行相应操作
- 如果在命令模式等情况下输入了错误命令（错误命令后还有待输入命令），此时也可以用<kbd>Esc</kbd>或<kbd>ctrl+[</kbd>或<kbd>ctrl+c</kbd>取消命令，输错命令了还可以按<kbd>backspace</kbd>取消命令


# 退出vim

## 处在命令模式时退出，可输入：
```
:w      存盘
:wq     存盘，退出
:q      退出（若有更改则提示保存）
:q!     退出，强制（不存盘，即不保存更改）
:e!     放弃更改，重新打开
```

- `:q`，如果更改了文件则不会退出，而是会提示没有write（即提示没有存盘），这时可以`:w`存盘了退出，或者添加感叹号！，即`:q!`强制不存盘退出


## 也可直接输入下列快捷键退出：
```
ctrl+w,q    等价于:q
ZZ          等价于:wq
ZQ          等价于:q!
```
- `ctrl+w,q`等价于`:q`，不是`:q!`
- `ZZ`为键入两个大Z
- `ZZ`或者`:wq`对于直接输入`$ vim`命令而新建的没有名称的文件来说（不是像`$ vim a.md`这种有文件名的），保存时会提示E32:no file name。所以用vim新建文件最好刚开始输入vim命令新建的时候就带上新建文件名，比如`$ vim a.md`创建一个名为a.md的文件，然后vim执行保存命令后就会自动在当前目录新建出a.md文件并写入编辑内容。

## 还可输入以下命令挂起vim编辑器：
```
ctrl+z      挂起vim编辑器进程到后台，返回到shell（shell中输入fg回车，回到vim编辑器）
```

# 视图移动

```
ctrl+e/y        向上/向下滚动一行(extra/yield line即向下额外获取一行/向上退让一行)(可在输入命令前输入数字，表示执行几次本操作)
ctrl+u/d        向上/向下滚动半屏(up/down)
ctrl+b/f        向上/向下滚动一屏(backword/forward)
上面3组命令在视图移动时，通常光标在当前视图中的第几行是不变的
(视图移动时光标会在所在行的句首)，
在视图滚动到文件尾或首不能滚动等情况时，光标才会在当前视图的行间移动。

zt/zz/zb        将当前行移动到屏幕的顶部/中部/底部位置
(光标仍在当前行且在行中的位置没变)
(顶部/底部，不指顶端/底端，一般在顶端下方/底端上方6行的位置)
```
# 光标移动


```
h,j,k,l     左/下/上/右移动光标；
            h,l 左右移动光标只能在当前行移动
            j,k 下上移动光标一般在当前列移动

backspace/space     光标在文档中逐字符前进/后退
enter               光标移动到下一行句首(不是行首)

+/-     移动到下一行/上一行的行首
0/$     光标移动到行首/行尾
^       光标移动到语句首

11G     光标移动到11行的行首
20|     光标移动到20列

10%     光标移动到文档的10%处（ctrl+g显示当前行百分比文档位置）

gg/G    光标移动到文件头/文件尾

H/M/L   光标移动到当前屏幕的高/中/低位置
        （高/低位置一般在顶端下方/底端上方6行的位置）

%       光标移动到匹配括号处

``      光标可在当前位置与上一次导航位置之间切换(上下左右移动不能算作导航，必须是执行了导航操作才算)

mx      光标处做标记x（x只能为单字符，因为按m然后再输入一个字符标记录入就结束了）
`x      光标移动到x标记处
'x      光标移动到x标记处的句首


fx/Fx   光标向右/向左跳到本行第一个x字符处（x可以是任意可键入字符，不包括tab等）（如果找不到，则什么也不会发生）
tx/Tx   光标向右/向左跳到本行第一个x字符前一个/后一个字符处

*/#     光标移动到下一个/上一个当前光标处的单词

n/N     光标移动到下一个/上一个之前在搜索模式或使用*/#等查找操作中搜索的单词/文本

{/}     如果当前光标没有在空行上，光标会向前/向后跳过中间非空行来到上一个/下一个新空行，
        如果当前光标已经处在空行，则光标会向前/向后跳过相邻空行和中间非空行来到上一个/下一个新空行

空行指没有内容的行，包括不能有空格或者tab(即只含有一个不可见的换行符\n)


w       光标跳到下一个单词头(标点符号算作单独的单词)
b       光标跳到当前单词的词头，如果已经处在当前单词的词头，就会跳到上一个单词的词头
e       光标跳到当前单词的词尾，如果已经处在当前单词的词尾，就会跳到下一个单词的词尾

其中大写W/B/E表示标点符号不算作单独的单词，单词只以空格分隔。

```
- <kbd>Esc</kbd>或<kbd>ctrl+[</kbd>或<kbd>ctrl+c</kbd>退出插入模式后，都会使光标位置向前挪一位

- 搜索模式`/`或者末行模式`:`都可以用`ctrl+n/p`或者`下上键`查看下一个或者上一个在搜索模式`/`下的搜索记录或者在末行模式`:`下的命令记录

## 使用w命令对下列不同文本进行光标移动，考察w命令的行为。
> `w/b/e`的行为是相似的

1. 标点符号可以看作单独的单词
   ```
   aa,bb cc\";dd-ee ff
   ```

2. 单词通常指`\w`也就是`[A-Za-z0-9_]`，  
(但在vim中不严格是这样，部分语言集的字符同样可以和`\w`的字符组成单词)
    ```
    th_ere're--some12...words123  first... sen__tence
        second-line  ...second  sentence.
    ```

1. 中文单独作为单词。
中英文标点符号可以混合组成单词。
    ```
    你好hello  world世界，，,,你好..。。ab..。。这个世界123...123真的really会好吗
        我不知道know
    third line.
    ```

1. 表情，中英文标点可以混合组成单词。
    ```
    hello你好..。。🏀💊🍇🍉🍜..。。123_haha  hey.
    ```

1. 部分语言集的字符可以混合组成单独的单词。
对于中文和英语，其分别会被视作单独的单词。
    ```
    中文españolEnglishहिन्दीالعربيةportuguêsবাংলাрусский日本語ਪੰਜਾਬੀ한국어தமிழ்
    ```

1. 对于换行
    ```
    hello





    world

    world


    world.
    ```

    其中的换行和空格情况为
    ```
    hello
    \n
    \n
    ···
    ··
    \n
    world
    \n
    ··world
    ··
    ··
    ··world.
    ```
    可以看到w/W对于单独的换行会视作单词，对于空格和只带有空格的行会全部跳过。


# 编辑

```
i/a     当前光标前/后插入
I/A     当前行首/尾插入
o/O     在当前行上面/下面新起一行

x/X     删除并复制光标处/光标处前1位字符（不会进入插入模式）
s/S     删除并复制光标处字符/光标所处行，并进入插入模式

r       按r后，键入一个字符，光标处字符会替换为键入字符

R       进入替换模式

J       删除当前行末尾换行符使下1行合并到当前行

~       切换当前英文字符的大小写

y       仅复制
d       删除并复制，相当于剪切
c       删除并复制，再进入插入模式

p/P     复制的内容粘贴到光标处字符后/字符前（粘贴后光标停在粘贴的字符上）

u       撤销
ctrl+r  重做

.       重复上一次执行的命令(不包括移动命令)

K       在terminal中临时打开当前单词的manual

=       在可视模式中选择文本后，按=重新只能缩进选择文本
        智能缩进也就是根据文档语言格式，决定怎么对行进行缩进

==      智能缩进当前行

>/<     indent/unindent可视模式下的选区
>>/<<   indent/unindent本行

```
- 上面会进入插入模式的有a/A,i/I,s/S,c/C,o/O
- `R` 进入替换模式，连续键入字符会在当前行不断向后替换光标处的字符，即使末尾已经没有字符了，这时候也会像替换光标处空字符一样不断向后插入键入的字符，而且替换字符不会换行，始终都在当前行。
- `~` 切换当前英文字符的大小写（切换，不是转大写），切换后光标移到下一字符。如果为非英文，则只移动光标位置
- 输入`:`进入末行模式，再输入2,3>>然后再回车，也就是`:2,3>>`，就会使2到3行的文本向后缩进一次（当然一次缩进的空格多少可以在配置文件中设置，参见后文）
- `ctrl+r` 重做redo，相当于vscode中的ctrl+y
- `p`不会粘贴<kbd>ctrl+shift+c</kbd>复制的内容，详见## 关于复制和粘贴



## 可带量词的命令
```
3$      光标移动到后面第3行的行尾（注意行首没有这个用法，因为输入30不是一个命令）

3s      执行3次s后进入插入模式，相当于3x后进入插入模式
3x

3p      执行3次p，即粘贴3次

3r      按3r后，键入一个字符，光标处向后3个字符会替换为键入字符

2J      执行2次J，即合并后两行到当前行

4dw     光标w移动4次后和开始光标位置之间的字符执行d，即删除后四个单词
4yw     光标w移动4次后和开始光标位置之间的字符执行y，即复制后四个单词
4cw     光标w移动4次后和开始光标位置之间的字符执行c，即改变后四个单词

2yy     对后两行执行yy，即复制后2行

2>>         缩进下面2行

:10,20>>    缩进10行到20行
:10,20y     复制10行到20行
:10,20d     删除10行到20行
```
- 操作个数与操作命令很多时候位置可以互换，比如`y2l`也可以为`2yl`，但比如`5x`不能为`x5`，因为x命令本身已经执行了操作
- 重复命令代表操作当前行，比如`dd`,`<<`,`yy`,`cc`,`==`
- 对于命令`2yy`，为知道复制的行数的情况，
  
  ```
  不容易得出行数时：
  开始行  输入ma做一个a标记
  结束行  输入y'a或d'a     复制/删除开始行到结束行（不是开始到结束位置,操作的是行）
  ```




## 组合命令

```
d0/d$/d^

d2j/d2k     向下/向上删除2行（实质是剪切）
y2j/y2k     向下/向上复制2行

dd,p        下移当前行
k,dd,p      上移当前行

```


## 速记表
```
y       仅复制
d       删除并复制，相当于剪切
c       删除并复制，再进入插入模式
```
|            | 更改c | 删除d | 复制y |
| :--------: | :---: | :---: | :---: |
| 到下一词头 |  cw   |  dw   |  yw   |
|   到词头   | ce/b  | de/b  | ye/b  |
|   到词尾   | cE/B  | dE/B  | yE/B  |
|  整个单词  |  caw  |  daw  |  yaw  |
|   一整行   |  cc   |  dd   | yy/Y  |
|   到行尾   | c$/C  | d$/D  |  y$   |
|   到行首   |  c0   |  d0   |  y0   |
|  单个字符  |   r   |  x/X  | yl/yh |


## 助忆全名
```
y(yank)
d(delete)
c(change)
p(paste)
J(join)
r(replace)
i(insert)
ctrl+r(redo)
H/M/L(high/middle/low)
zt/zz/zb(top/zz/bottom)
w(word)
b(beginning)
e(ending)
daw(delete all word)
:sp(split)
:vsp(vertical split)
v(visual)
ctrl+e/y(extra/yield line即向下额外获取一行/向上退让一行)
ctrl+u/d(up/down)
ctrl+b/f(backword/forward)
ctrl+n/p(next/previous)
fx/Fx(find)
ma(mark)
u(undo)
ctrl+r(redo)
```


## 插入模式中可使用的快捷键
```
ctrl+w/u        删除光标前面的一个单词/前面的所有字符，这个与emacs一样
ctrl+n/p        从提示框的上面/下面开始选择完成单词(连续键入则会向下/向上切换)
ctrl+o          从插入模式临时进入一次命令模式（执行完后随即返回插入模式）
```



# 可视模式
> 进入可视模式后，移动光标就相当于鼠标在选择原光标位置和当前光标位置的选区。所以可视模式也可以理解为选择模式。
```
v       进入可视模式
V       进入可视行模式，以行为单位的可视模式
ctrl+v  进入可视块模式，相当于vscode中的垂直选区
```
- 进入可视模式/可视行模式/可视块模式后，可以使用导航命令如%，在可视模式v下为选择括号间的内容。
- 进入可视模式/可视行模式/可视块模式后，c,d,y,=,~等命令都是可用的，退出可视模式后，可键入`p`命令粘贴在可视模式中复制的内容



# 查找与替换
```
:s/str1/str2/g          替换当前行str1为str2

:%s/str1/str2/g         替换所有str1为str2

:10,20s/str1/str2/g     替换从10行到20行所有str1为str2(如果不加/g则只会替换每一行第一个匹配项)

:%s/^\n$//g             删除空行
:g/xx/d                 删除包含xx字符串的行

/str		查找str,然后可通过按n/N查找下一个/上一个
?str		反向查找（与/str的搜索顺序相反，其按n为向上搜寻）

d/str		向后删除到str(不删str)
d?str		向前删除到str(删除str)

```
- 输入了`/str`或`?str`等命令后要按回车才开始查找，这时可用n/N导航到查找结果下一个/上一个
- 


# 操作
```
记录宏:
qa  开始记录宏a
q   结束记录
@a  应用宏a
（关于记录宏的解释，见下方）

:abbr hw hello world    输入hw再输入结束符会用全名替代
（关于什么是结束符，见下方）


"x接c/d/y相关命令    将c/d/y相关命令复制的内容标记为x（x为任意字符）
"xp                 将标记为x复制的内容粘贴到当前光标处
比如命令"ay$将当前光标到行尾的文本复制，并将此复制内容标记为a，然后命令"ap将标记为a复制的内容粘贴到当前光标处（注意双引号"为命令）
```
- 宏(macro)的意思就是一系列操作，从`qa`开始记录宏a到`q`结束记录期间的所有操作都会被记录下来（包括光标移动操作，插入的字符，执行的命令等等），`@a`应用宏的时候就会将宏a记录的这些操作在当前光标处全部再执行一遍。
- `:abbr`和autohotkey的热字串类似, 同样需要结束符来结束。结束符指的是空格，换行，符号，退出当前编辑模式，任何表示已经没有正常输入该单词的字符或者命令都叫结束符
- 怎样删除该缩写，当然最简单的就是比如`abbr: hw helloworld`要删除的话就是`abbr: hw hw`，当然有没有更好的方式，查一下。退出vim过后，该缩写也应该失效了



# 分屏

## terminal中打开文件时就分屏
```
$ vim -on file1 file2...      水平分屏（上下分屏）
$ vim -On file1 file2...      垂直分屏（左右分屏）
```

## 创建空白内容的水平分屏
```
ctrl+w,n        水平分屏出一个空文档并获得焦点

:new filename   水平分屏出一个名为filename的空文档并获得焦点（如果不跟filename那么效果和ctrl+w,n是一样的）
```
- `ctrl+w,n`和`:new`分屏出的新文件都没有名称，保存时记得要填写名称，否则会丢失编辑内容


## 打开文件作为分屏
```
:vsp filename   垂直分屏打开文件
:sp filename    水平分屏打开文件
```
## 复制当前文件到分屏
也就是当前窗口和分屏中的内容都为当前文件的内容
```
ctrl+w,s        水平复制分屏
ctrl+w,v        垂直复制分屏
```
## 关闭分屏
```
ctrl+w,o        关闭其它分屏，只保留当前分屏
ctrl+w,c        关闭当前分屏
```
## 切换分屏
```
ctrl+w,w        分屏之间逐个切换
ctrl+w,h/j/k/l  切换到h,j,k,l位置
```


# 其它
```
gf          打开以当前光标下单词为名的文件(应该是在当前路径下查找)

!ls -l      在外部terminal临时执行一下ls -l

:10,$ w test.cpp    取行10到最后一行内容保存到test.cpp

:r test.cpp         将test.cpp文件中的所有内容粘贴到当前光标处

:h(:help)           显示帮助(ctrl+w,q退出帮助窗口)
```


# 关于复制和粘贴

- vim与linux系统各自有自己的剪贴板空间，vim中不能用`p`命令粘贴Linux系统剪贴板的内容，Linux系统中也不能用<kbd>ctrl+v</kbd>或者<kbd>ctrl+shift+v</kbd>粘贴vim中剪贴板中的内容（即通过c,y,d,x等命令复制的内容）。
- 但vim还是能够与系统剪贴板间通信的。就是通过<kbd>ctrl+shift+c</kbd>和<kbd>ctrl+shift+v</kbd>，在terminal的vim中，在命令模式下，用鼠标选择文本，然后按<kbd>ctrl+shift+c</kbd>就将文本复制到了系统剪贴板；在插入模式下，按<kbd>ctrl+shift+v</kbd>就将系统剪贴板中的内容插入到了vim编辑器文本中。



# 配置文件
先对配置文件备份，然后再对其进行修改
```
备份    sudo cp /etc/vim/vimrc /etc/vim/vimrc.backup
修改    sudo vim /etc/vim/vimrc
```

## 推荐添加项
```
set cursorline      "突出显示当前行
set shiftwidth=4    "设定<<,>>移动的宽度
set tabstop=4       "设定tab的长度为4
set incsearch       "输入搜索内容时就显示搜索结果
set hlsearch        "高亮显示搜索文本
set smartindent     "开启新行时自动缩进
set mouse=iv        "在进入插入模式后用鼠标选择为可视选择模式
```
- 其中`smartindent`已经不被推荐使用了
- 其中`set mouse=iv`，在进入插入模式后用鼠标选择为可视选择模式，这样可以点击输入地点就可以输入而且还可以鼠标选择可视区域，回到命令模式后又可以使用<kbd>ctrl+shift+c</kbd>进行复制，详细文档为`:h 'mouse'`

## 其它项目
```
syntax on           "开启语法高亮
set number          "显示行号
set ignorecase      "搜索时忽略大小写
set smartcase       "搜索时在有一个或以上大写字母时保持对大小写敏感
set softtabstop=4   "按退格键时可以一次删掉4个空格
```
- 其中syntax on可以不用写了，现在在vimrc中默认就有下列设置
  
    ```
    if has("syntax")
    syntax on
    endif
    ```
    也就是只要vim支持该文件类型的syntax就会自动开启，所以不用自己显示再设置了

## vimrc文件默认推荐项
但默认都是被注释了的

原文为：
```
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden			" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
```

## 末行模式可设置项
```
:set number/nonumber        显示/关闭行号
:set hlsearch/nohlsearch    设置/关闭高亮显示查找结果
```
- 要想知道某个命令的简写或怎么关闭某个命令,请查看文档如`:h 'ignorecase'`


## 自动匹配括号设置
```
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i
```

## 让vim中的tab为4个空格
使其与vscode一致（vscode默认tab为4个空格）

### stackoverflow上的回答:
```
As has been pointed out in a couple of other answers, 
the preferred method now is NOT to use smartindent, 
but instead use the following (in your .vimrc):

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
```
- 第一句`filetype plugin indent on`在vimrc文件中默认就在，只不过被注释掉了。原文为：
  
  ```
  " Uncomment the following to have Vim load indentation rules and  plugins
  " according to the detected filetype.
  "filetype plugin indent on
  ```

# vi
服务器上的vim或者非terminal vim

值得关注的可以与不可以：

## 不可以：
- <code>``</code>不可以返回上次位置
- `ctrl+v/z/n/u/p/f/b/g...`不可以，这些都对应的是编辑器的操作，而不能对应到vim的指令
- 不能存缩写
- 不可以进入可视块模式`ctrl+v`
- 不能使用`%`跳到匹配括号处


## 可以：
- 可以录制宏
- 可以做标记
- 可以进入末行模式
- 可以使用`/`或`?`进行查找
- <kbd>ctrl+[</kbd>返回命令模式


# vim学习链接
Vim Cheat Sheet
https://vim.rtorr.com/