# 读前须知
本文作者：[jack518](https://www.jack518.com/)
<br>文章GitHub地址：[链接](https://github.com/baofengyujue/jupc/blob/main/markdown.md)
<br>引用请注明出处。

## 注意/说明
- <kbd>ctrl+w,q</kbd>为按了<kbd>ctrl+w</kbd>再按<kbd>q</kbd>，却别于<kbd>ctrl+w,ctrl+q</kbd>
- `ctrl+d/u`代表`ctrl+d`或者`ctrl+u`，而不是`ctrl+d`或者`u`，如果是后者的情况不会采用这种表达形式
- shell即是Ubuntu/Linux中的命令行，命令行窗口在Ubuntu/Linux中称为terminal，terminal和shell的区别在于如果是在服务器输入命令就处在shell之中，因为服务器操作没有图形界面，所以就没有terminal
- vim中`d`本意为删除，但其效果却是剪切，注意文中关于`d`删除的说法。
- 文中多次出现的`删除并复制`即为`剪切`
- vim中大小写命令是不同的意思，注意区分命令的大小写如`i/I`,`w/W`
- 文中很多符号命令要注意，如<code>\`x</code>,`'x`,`"x`其中的反撇号，单引号，双引号都是命令
- 注意句首与行首的区别，句首代表本行语句首位置，行首代表本行开头的位置。
- 有关`d/D`,`c/C`,`x/X`,`s/S`等命令的删除都表示删除并复制（即剪切）的意思
- 当前行即当前光标所在行，当前字符即当前光标处的字符
- 文中查找(find)与搜索(search)是一个意思，在vim中查找被表述为search，但本文不区分
- 文中没有只使用中文标点或者英文标点，但中英文符号都是匹配的相应中英文符号，即`（）`，`()`，`‘’`，`''`
- 文中的‘任意键入字符’不包括tab字符等


# 模式切换

## 处在命令模式时，可以输入：
```
i       进入"插入模式"  可在左下角看到 -- INSERT -- 标识
R       进入"替换模式"  可在左下角看到 -- REPLACE -- 标识
v       进入"可视模式"  可在左下角看到 -- VISUAL -- 标识
:       进入"末行模式"  可在左下角看到冒号 : 出现
/       进入"搜索模式"  可在左下角看到斜杠 / 出现
```

- 进入到上面任何一种模式后都可以按<kbd>Esc</kbd>或<kbd>ctrl+[</kbd>或<kbd>ctrl+c</kbd>回到命令模式
- `命令模式`即为`h,j,k,l`可以左下上右移动光标的模式，在该模式下可以键入各种命令
- 其中进入`末行模式`或`搜索模式`后，都还需要输入额外指令才能执行相应操作
- 如果在命令模式等情况下输入了错误命令（错误命令后还有待输入命令），此时也可以用<kbd>Esc</kbd>或<kbd>ctrl+[</kbd>或<kbd>ctrl+c</kbd>取消命令，输错命令了还可以按<kbd>backspace</kbd>取消命令
- <kbd>ctrl+[</kbd>行为和<kbd>Esc</kbd>是一致的（还没有发现不一致的地方），都可用于退出查找模式等，能用<kbd>Esc</kbd>的地方都能用<kbd>ctrl+[</kbd>完成功能。
- 搜索模式`/`或者末行模式`:`都可以用`ctrl+n/p`或者`下上键`查看下一个或者上一个在搜索模式`/`下的搜索记录或者在末行模式`:`下的命令记录




# 保存文件/退出vim
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
ctrl+z      挂起vim/vi编辑器进程到后台，返回到shell
            （shell中输入fg回车，可回到vim编辑器）
```
- shell即terminal命令行，因为挂起vim进程不限于terminal的vim，
  服务器的vi也可以挂起进程，但服务器的命令行应该称为shell




# 视图移动
```
ctrl+e/y        向上/向下滚动一行
                (extra/yield line即向下额外获取一行/向上退让一行)
                (可在输入命令前输入数字，表示执行几次本操作，
                比如输入3然后ctrl+e，即为向下滚动3行)

ctrl+u/d        向上/向下滚动半屏(up/down)
ctrl+b/f        向上/向下滚动一屏(backword/forward)

上面3组命令在视图移动时，通常光标在当前视图中的第几行是不变的
(视图移动时光标会在所在行的句首)，
在视图滚动到文件尾或首不能滚动等情况时，光标才会在当前视图的行间移动。

zt/zz/zb        将当前行移动到屏幕的顶部/中部/底部位置(top/zz/bottom)
                (光标仍在当前行且在行中的位置没变)
                (顶部/底部，不指顶端/底端，一般在顶端下方/底端上方6行的位置)
```


# 移动命令
> 执行移动命令后，光标都会移动

```
h,j,k,l     左/下/上/右移动光标；
            h,l 左右移动光标只能在当前行移动
            j,k 下上移动光标一般在当前列移动

backspace/space     光标在文档中逐字符前进/后退
enter               光标移动到下一行句首(不是行首)

+/-     移动到下一行/上一行的行首
0/$     光标移动到行首/行尾
^       光标移动到语句首

w       光标跳到下一个单词头(标点符号算作单独的单词)
b       光标跳到当前单词的词头，如果已经处在当前单词的词头，就会跳到上一个单词的词头
e       光标跳到当前单词的词尾，如果已经处在当前单词的词尾，就会跳到下一个单词的词尾
        
W/B/E   同w/b/e，但标点符号不算作独立单词，单词只以空格分隔

11G     光标移动到11行的行首（:set number/nonumber显示/关闭行号）
20|     光标移动到20列

10%     光标移动到文档的10%处（ctrl+g显示当前行百分比文档位置）

gg/G    光标移动到文件头/文件尾

H/M/L   光标移动到当前屏幕的高/中/低位置
        （高/低位置一般在顶端下方/底端上方6行的位置）

%       光标移动到匹配括号处
        （如果当前光标没在括号上，则命令%会使光标跳到附近括号上）

fx/Fx   在当前行，光标跳到之后/之前的x字符处(x为任意键入字符)
        如果在之后/之前有多个x字符，可以使用分号或逗号在本行x字符出现处移动
        （只在当前行查找和移动）
        （如果在当前行找不到x，则什么也不会发生）

;       执行一次最近一次的fx/Fx命令
,       反方向执行一次最近一次的fx/Fx命令
        （可不断重复;或,命令，使光标在当前行x字符出现处移动）
        （分号和逗号命令在任意行都可执行，只要最近有执行过fx/Fx）

tx/Tx   在当前行，光标跳到之后/之前的x字符前一个/后一个字符处，其它行为与fx/Fx相同
        （tx往后找，光标在x字符前；Tx往前找，光标在x字符后）

*/#     光标移动到下一个/上一个当前光标所处的单词（连续按*/#或n/N不断搜索并移动）

n/N     光标移动到下一个/上一个之前执行/str或使用*/#等查找操作中搜索的单词/文本
        (fx/Fx搜索的字符不算)

{/}     如果当前光标没有在空行上，光标会向前/向后跳过中间非空行来到上一个/下一个新空行，
        如果当前光标已经处在空行，则光标会向前/向后跳过相邻空行和中间非空行来到上一个/下一个新空行
        空行指没有内容的行，包括不能有空格或者tab(即只含有一个不可见的换行符\n)

```
- <kbd>Esc</kbd>或<kbd>ctrl+[</kbd>或<kbd>ctrl+c</kbd>退出插入模式后，都会使光标位置向前挪一位



## Marks and Positions
```
mx      光标处做标记x(x为任意键入字符)
        （x只能为单字符，因为按了m，然后再输入一个字符标记，录入就结束了）

`x      光标移动到x标记处
'x      光标移动到x标记处的句首
y`x     复制到x标记处（注意不是yx）

``      go to the position before the last jump
        光标回到最近一次导航操作前的位置
        （最近一次导航操作包括命令``做的导航，
        所以不停按``会在两个位置之间切换）（行为还没搞清楚）
        （在用`x跳到x标记处后，用``返回原位置很方便）

`.      go to the position of the last change in this file
        光标回到文件上一次更改处（即使重开vim，也能返回）
```

下面为[Vim Cheat Sheet](https://vim.rtorr.com/)网站中的描述：
```
:marks      list of marks
ma          set current position for mark A
`a          jump to position of mark A
y`a         yank text to position of mark A

:ju[mps]    list of jumps
Ctrl+i      go to newer position in jump list
Ctrl+o      go to older position in jump list

:changes    list of changes
g,          go to newer position in change list
g;          go to older position in change list

```
- 反撇号<code>\`</code>和单引号号`'`都可以结合标记使用，
  但<code>\`</code>是移动到标记处，`'`是移动到标记处句首



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
    可以看到`w/W`对于单独的换行会视作单词，对于空格和只带有空格的行会全部跳过。


# 编辑命令
```
i/a     当前光标前/后插入
        （其中a插入过程为：按a，光标移动到下一字符比如'x'上并进入插入模式，
        然后输入字符，输入的字符在'x'前插入，光标始终停留在'x'上

I/A     当前行首/尾插入

o/O     在当前行下面/上面新起一行

x       删除（剪切）光标处字符，光标移到前一位
X       删除（剪切）光标处前1位字符，光标仍在原位

s/S     删除（剪切）光标处字符/光标所处行，并进入插入模式（S等价于cc）

yl      复制光标处字符（y接小写L，不是y1）
yh      复制光标处前1位字符

r       按r后，键入一个字符，光标处字符会替换为键入字符

R       进入替换模式

J       合并下一行到当前行
        （如果当前行行尾没有空格，下一行行首没有空格，那么两行连接处会有一个空格，
        且执行J命令后，光标会在这个空格上）
        （合并行时会保留当前行末尾的空格，删掉下一行行首的空格）

~       切换当前光标处英文字符的大小写
        （也可在可视模式下，切换选择文本的大小写）
        （如果为非英文，则只移动光标位置）

y       仅复制
d       删除（剪切）
c       改变，即剪切后进入插入模式

Y       复制当前行（一整行，不是只复制光标后部分，相当于yy）
D       删除（剪切）到行尾(删除包括光标处的字符，和行尾端的空格)，相当于d$
C       删除（剪切）到行尾(删除包括光标处的字符，和行尾端的空格)，相当于d$，并进入插入模式

yy      复制当前行（相当于Y）
dd      删除（剪切）当前行
cc      删除（剪切）当前行，并进入插入模式

p/P     vim内命令复制的内容，粘贴到光标处字符后/字符前
        （粘贴后光标停在新粘贴的字符末尾）
        (y/d/c/Y/D/C/yy/dd/cc等操作都会复制相关文本到vim内部剪贴板中)
        (区分vim内部剪贴板和系统剪贴板；
        内部剪贴板保存的是vim内部命令y/d/c等复制的内容，详见下方注释)

U       撤销最近一次编辑的行的在该行的所有修改
        （注意是以行为单位，在该‘行’上的所有修改，
        而且还要是最近一次，
        不停按U只会在最近一次和当前对行修改过后的两个状态间切换）

u       撤销（相当于vscode中的ctrl+z，且没有特殊行为）
ctrl+r  重做（相当于vscode中的ctrl+y，且没有特殊行为）

.       重复上一次执行的命令(不包括h,j,w,%等移动命令)
        （编辑命令会再次执行，以及进入插入模式中输入的所有字符，按.会再次插入）

K       临时退出vim编辑器，在terminal中打开当前单词的manual
        （如果有单词的manual，在manual页按q退出到terminal中，再按enter从terminal返回到vim编辑器）
        （如果没有单词的manual，直接在terminal中按enter就从terminal返回到vim编辑器了）

=       re-indent text which selected in visual mode
        只能在可视模式中使用单等号

==      re-indent current line
        （也不知道vim具体根据什么重新缩进的，
        反正效果就是当前行的内容会给你缩进得与上下行在一个缩进区间上）

>/<     indent/unindent可视模式下的选区
>>/<<   indent/unindent当前行
```

- 上面会进入插入模式的有`a/A`,`i/I`,`s/S`,`c/C`,`o/O`
- `R` 进入替换模式，连续键入字符会在当前行不断向后替换光标处的字符，即使末尾已经没有字符了，这时候也会像替换光标处空字符一样不断向后插入键入的字符，而且替换字符不会换行，始终都在当前行。
- `~` 切换当前英文字符的大小写（切换，不是转大写），切换后光标移到下一字符。如果为非英文，则只移动光标位置
- 输入`:`进入末行模式，再输入2,3>>然后再回车，也就是`:2,3>>`，就会使2到3行的文本向后缩进一次（当然一次缩进的空格多少可以在配置文件中设置，参见后文）
- `p`不会粘贴<kbd>ctrl+shift+c</kbd>复制的内容，详见[关于复制和粘贴](#关于复制和粘贴)
- 智能缩进也就是根据文档语言格式，决定怎么对行进行缩进



# 量词+命令
- `w/b/e`以`w`为例
- `y/d/c`以`y`为例

```
+移动命令：
3h/j/k/l    执行3次h/j/k/l

3backspace/space/enter          执行3次backspace/space/enter

3$      光标移动到后面第3行的行尾
        （注意没有30和3^的用法，3^为执行3次^，相当于1次^）

3w      执行3次w，即光标往后移动3个单词

3fx/Fx  执行3次fx/Fx，即在当前行往后/往前跳到第3次出现字符x的地方
3;/,    在当前行，正向/反向执行3次最近一次的fx/Fx命令

3*/#    执行3次*/#，即往后/往前跳到第3次出现光标所在单词的地方
3n/N    执行3次n/N，即往后/往前跳到第3个查找项

3{/}    执行3次{/}，即移动到上第3个空白区域尾部/下第3个空白区域尾部

+编辑命令：
3i      输入3i后会进入插入模式，然后输入字符，退出插入模式后，
        会将刚才输入的包括换行符等所有字符再重复输入2遍，总共输入3遍

3o      输入3o后会进入插入模式，然后输入字符，退出插入模式后，
        会将刚才输入的包括换行符等所有字符所在行再重复输入2遍，总共输入3遍
        与3i的区别是重复输入的是‘行’
3O      与3o只是方向相反

3x      执行3次x，即删除后3个字符
        （包含光标处字符）

3s      执行3次s命令的删除后进入插入模式，相当于3x后进入插入模式
3S      对下3行执行删除，再进入插入模式

3rx     替换后3个字符为x(x为任意键入字符)
        （包含光标处字符）
        （实现不了在空行输入指定数目的字符的功能，因为空行没有字符可供替换）

3J      执行3次J，即合并后3行到当前行
        （行与行之间会以空格隔开）


3p      执行3次p，即粘贴3次

3u          撤销3次
3接ctrl+r   重做3次

3.      重复上一次执行的命令3次

3~      切换后3个字符的大小写

3>>     缩进后3行
3==     重新缩进后3行

+编辑命令+移动命令：
3yl     复制后3个字符（包含光标处字符）
3yh     复制前3个字符

3yj     向下复制4行（包含光标所在行）（注意是4行）
3yk     向上复制4行（包含光标所在行）

3yy     对下3行执行yy，即复制后3行（包含光标所在行）（注意不等同于3yj复制4行）

3yw     光标w移动3次后和开始光标位置之间的字符执行y，即复制后3个单词

其它：
:10,20>>    缩进10行到20行
:10,20y     复制10行到20行
:10,20d     删除10行到20行
```

- 操作个数与操作命令很多时候位置可以互换，比如`y3l`也可以为`3yl`。其中`y3l`代表`y`复制到`3l`的位置，`3yl`代表执行3次`yl`。但比如`3x`不能为`x3`，因为x命令按一次就执行结束了，再接3就没有意义了。
- 重复命令代表操作当前行，比如`dd`,`yy`,`cc`,`==`,`<<`
- 对于命令`2yy`，为知道复制的行数的情况，
  
  ```
  不容易得出行数时：
  开始行  输入ma做一个a标记
  结束行  输入y'a或d'a     复制/删除（剪切）开始行到结束行（不是开始到结束位置,操作的是行）
  ```
- 注意`3^`并不是跳到前面第3行的句首，而是执行3次`^`，相当于一次`^`，所以`^`不用结合量词
- 一些组合方式没有列出，因为不常用/使用几率不大/不能组合/没有意义/行为复杂。
- 可以看到向后执行的命令都包含光标处字符，向前的不包含。



# 组合命令
- `w/b/e`以`w`为例
- `y/d/c`以`y`为例
- 省略号...表示操作到相应位置

```
y接backspace/space      复制光标前一位/光标处的字符
y接enter                复制当前行，相当于yy
y0/y$   ...
y^      ...
yw      ...
y11G    ...
y20|    ...
yfx/yFx ...
y*/#    ...
y{/}    ...
y%      复制括号及括号内的内容
yl      复制光标处字符
y`x     复制到x标记处

```
- 主要就是y/d/c编辑命令可以跟移动命令了，其它编辑命令基本都不能跟，
  而不是这里没列出。

# 其它常用组合
```
dd,p        下移当前行
k,dd,p      上移当前行

10o接esc    在下方开出10行空行
10O接esc    在上方开出10行空行

xp      transpose two letters (delete and paste)
```

# 插入模式中可使用的快捷键
```
ctrl+w/u        删除光标前面的一个单词/前面的所有字符，这个与emacs一样

ctrl+n/p        从自动完成列表的上面/下面开始选择完成单词
                (连续键入ctrl+n/p则会向下/向上切换自动完成项)

ctrl+t/d        tab或de-tab一次本行

ctrl+o          从插入模式临时进入一次命令模式（执行完后随即返回插入模式）
```

- 在插入模式中，输入一个单词前面部分然后按<kbd>ctrl+n</kbd><kbd>或ctrl+p</kbd>就会调出自动完成列表(即autocomplete操作)，然后再按<kbd>ctrl+n</kbd><kbd>或ctrl+p</kbd>向下/向上切换完成列表选项。在第一次调出完成列表或切换时，提示选项就自动输入了，不用按tab或者enter上屏了，这时可以按空格，句点，分号等等继续输入或者按退格删掉一部分提示内容。


# 速记表
```
y       仅复制
d       删除（剪切）
c       改变，即剪切后进入插入模式
```
|  位置/数量  | 更改c | 删除d | 复制y |
| :---------: | :---: | :---: | :---: |
| 到下一词头  |  cw   |  dw   |  yw   |
| 向后2个单词 |  2cw  |  2dw  |  2yw  |
|   到词头    | ce/b  | de/b  | ye/b  |
|   到词尾    | cE/B  | dE/B  | yE/B  |
|  整个单词   |  caw  |  daw  |  yaw  |
|   一整行    |  cc   |  dd   | yy/Y  |
|   到行尾    | c$/C  | d$/D  |  y$   |
|   到行首    |  c0   |  d0   |  y0   |
|  单个字符   |   r   |   x   |  yl   |
|   2个字符   |  2s   |  2x   |  2yl  |


# 助忆全名
```
y(yank)
d(delete)
c(change)
p(paste)
J(join)
r/R(replace)
i/I(insert)
a/A(insert append)
o/O(open a new line)
s/S(substitute)
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
fx/Fx(find x)
ma(mark a)
u(undo)
ctrl+r(redo)
:set hlsearch(highlight search)
:reg[isters]
```


# 可视模式
> 进入可视模式后，移动光标就相当于鼠标在选择原光标位置和当前光标位置的选区。所以可视模式也可以理解为选择模式。

```
v       进入可视模式
V       进入可视行模式，以行为单位的可视模式
ctrl+v  进入可视块模式，相当于vscode中的垂直选区
```
- 进入可视模式/可视行模式/可视块模式后，可以使用导航命令如`%`，在可视模式`v`下为选择括号间的内容。

## 可视模式下的命令
```
c,d,y   edit-related
=,>,<   indent-related

o       move to other end of marked area
O       move to other corner of block(针对可视块模式的)
~       switch case
u       change marked text to lowercase
U       change marked text to uppercase
```
- 注意命令模式下`u/U`表示`撤销`/`撤销行修改`
- 退出可视模式后，可键入`p`命令粘贴在可视模式中复制的内容


# 查找与替换
```
(键入了下列/str等命令后，还需回车才会执行相应查找或替换操作)

:s/str1/str2/g          替换当前行str1为str2

:%s/str1/str2/g         替换所有str1为str2

:10,20s/str1/str2/g     替换从10行到20行所有str1为str2
                        (如果不加/g则只会替换每一行第一个匹配项)

:%s/^\n$//g             删除空行
:g/xx/d                 删除包含xx字符串的行

/str            正向查找str，回车后可按n/N查找下一个/上一个
?str            反向查找str（与/str的搜索顺序相反，其按n为查找上一个）
                (按n/N查找下一个/上一个，意思为使光标移动到下一个/上一个str)

d/str           向后删除到str(不删str)
d?str           向前删除到str(删除str)
                (按d，然后按/，再键入str，再回车，即为向后删除到str)
                (注意不是在末行模式中，即不是:d/str，这样会报错)

*/#             见移动命令

n/N             在上述查找命令的结果中正向/反向查找下一个/上一个

:set hlsearch/nohlsearch    设置/关闭高亮显示查找结果
```
- 输入了`/str`或`?str`等命令后要按回车才开始查找，这时可用`n/N`导航到查找结果的下一个/上一个
- hlsearch高亮显示查找结果设置，不对fx/Fx查找的x字符进行高亮，会对/str或?str和*/#等查找命令所找的字符串，在文档所有出现地方进行高亮


# 操作
```
qa   开始记录宏a
q    结束记录
@a   应用宏a
     (关于宏的解释，见下方)

:abbr hw hello world    设置字符串hello world的简写为hw，
                        在插入模式下，输入hw再输入结束符会用全称替代hw
                        (关于什么是结束符，见下方)

"xy     输入"xy后还要接移动命令如w，这时就构成yw复制单词了，
        前面命令"x就是将后面yw复制的单词注册为x(x为任意键入字符)
        (这里不一定为命令y，y/d/c都可，它们都会复制内容)
"xp     将注册为x复制的内容，粘贴到当前光标处

:reg    显示注册项
```

- 宏(macro)的意思就是一系列操作，从`qa`开始记录宏a到`q`结束记录期间的所有操作都会被记录下来（包括光标移动操作\[只会记录编辑前光标的最后位置]，插入的字符，执行的命令等等），`@a`应用宏的时候就会将宏a记录的这些操作在当前光标处全部再执行一遍。
- `:abbr`和autohotkey的热字串类似, 同样需要结束符来结束。结束符指的是空格，换行，符号，退出当前编辑模式，任何表示已经没有正常输入该单词的字符或者命令都叫结束符
- 怎样删除该缩写，当然最简单的就是比如`abbr: hw helloworld`要删除的话就是`abbr: hw hw`，当然有没有更好的方式，查一下。退出vim过后，该缩写也应该失效了
- 注意[Vim Cheat Sheet](https://vim.rtorr.com/)网站内有访问系统剪贴板的命令，如`"+y`或`"*y`复制到系统剪贴板和`"+p`或`"*p`从系统剪贴板粘贴，但在Ubuntu下terminal之vim中测试，这些命令都无法访问系统剪贴板。查了一下，要很多更改和设置才可以，所以还是使用<kbd>ctrl+shift+c/v</kbd>吧，别折腾了:)
- Tip Registers are being stored in ~/.viminfo, and will be loaded again on next restart of vim.



# 分屏
- 水平分屏<==>上下分屏，在上方新开屏
- 垂直分屏<==>左右分屏，在左边新开屏
- 分屏后，新开的屏都会获得焦点
- 打开和保存文件都是在当前目录下(即开始打开vim编辑器时的目录)

## terminal中打开文件时就分屏
```
$ vim -on file1 file2...      水平分屏
$ vim -On file1 file2...      垂直分屏
```

## 创建空白内容的水平分屏
```
ctrl+w,n        水平分屏出一个空文档，相当于:new

:new filename   水平分屏出一个名为filename的空文档
                (如果不跟filename，那么效果和ctrl+w,n是一样的)
                (如果当前目录已经有filename文件，则是水平分屏打开该文件)
```
- `ctrl+w,n`，`:new`分屏出的新文件都没有名称，保存时记得要填写名称，否则会丢失编辑内容！

## 打开文件作为分屏
- 如果filename在当前目录下不存在，则为新建filename文件
- 如果不跟filename，则为复制分屏当前文件
```
:vsp filename   垂直分屏打开文件
:sp filename    水平分屏打开文件
```

## 复制当前文件到分屏
也就是当前窗口和分屏中的内容都为当前文件的内容
```
ctrl+w,v        垂直复制分屏，相当于:vsp
ctrl+w,s        水平复制分屏，相当于:sp
```

## 切换分屏
```
ctrl+w,w        分屏之间逐个切换
ctrl+w,h/j/k/l  切换到h,j,k,l位置的分屏
```

## 关闭分屏
```
ctrl+w,o        关闭其它分屏，只保留当前分屏
ctrl+w,c        关闭当前分屏
```



# 其它
```
gf          打开以当前光标下单词为名的文件(应该是在当前路径下查找)

:!ls -al      在外部terminal临时执行一下ls -al

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
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
```

## 末行模式常用设置项
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
- 第一句*filetype plugin indent on*在vimrc文件中默认就在，只不过被注释掉了。原文为：
  
  ```
  " Uncomment the following to have Vim load indentation rules and  plugins
  " according to the detected filetype.
  "filetype plugin indent on
  ```

# vi
服务器上的vim或者非terminal的vim

值得关注的*可以*与*不可以*：

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


# vim推荐学习链接
Vim Cheat Sheet
https://vim.rtorr.com/

其中的目录我重新排序了一下
1. Global                   全局指令
2. Exiting                  退出vim
3. Cursor Movement          光标移动
4. Insert Mode              插入模式
5. Editing                  编辑
6. Cut and Paste            剪切与粘贴
7. Indent text              缩进文本
8. Search and Replace       搜索与替换
9. Marking text(visual mode)    标记文本/选择文本（即可视模式）
10. Visual commands          可视模式下的命令
11. Marks and Positions      标记与位置
12. Registers                注册指令
13. Macros                   宏指令
14. Search in multiple files     多文件下搜索
15. Working with multiple files  多文件同时工作/编辑
16. Tabs                     窗口标签
17. Diff                     