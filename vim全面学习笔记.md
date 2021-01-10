- vim笔记中，字母大小写是否为shift加字母要说明
- 文中许多符号加命令的方式要在文章开头做出说明，说明本文的表达方式，不然读者会搞不清经常，比如"+c/d/y表示shift加逗号过后键入c或d或y
- 文中的d应该是剪切而不是删除，注意说明
文中说明d(delete)的时候，删除并复制，加上一句相当于剪切
文中的删除并复制是否能改为剪切
- 表示或的斜杠符号/，的两边选项和前文相连，容易造成歧义或误解，多使用标点符号或分隔符
- 注意句首与行首的区别
# vim快捷键

### 基础:

用vim打开文件过后初始为命令模式

命令模式->插入模式:

    i/a		当前光标前/后插入
    I/A		当前行首/尾插入
    
    用上面命令插入也就默认进入了插入模式,一个叫法而已

命令模式->末行模式:

	shift+;		进入末行模式(也就是冒号:进入末行模式)
> 只存在命令模式和插入模式/末行模式的互相切换

插入模式/末行模式->命令模式:

```
esc/ctrl+[或ctrl+c	退出插入模式/末行模式,两者有细微区别
```

如果输入错误了，同样也可以用ctrl+[或ctrl+c撤回

### 退出vim:


    :w		存盘
    :wq		存盘,退出
    :q!		退出,强制(不存盘)
    :e!		放弃更改,重新打开


```
ctrl+w,q	等价于:q(ctrl+w了再按q,ctrl+w->ctrl+q没有反应)
ctrl+z		暂停vim,回到shell,再在shell中输入fg即可回到vim
Z+Z			same as :wq
Z+Q			same as :q!
```
ctrl+w,q是等价于q还是q!要说明
Z+Z对于新建文件，保存时会提示E32:no file name

### 其它:

```
:new [filename]		上面分屏新开出一个空文档并获得焦点(不跟文件名时保存的时候要提供文件名如:wq a.txt)(如果不保存新开的文件的话,则临时文件不会保存到目录下即使它有名字)
u/ctrl+r		撤销/重做
.				重复上一次执行的命令(不包括移动命令)
ctrl+z			暂停vim,回到shell,再在shell中输入fg即可回到vim
K				在terminal中临时打开当前单词的manual

少用:
gf		打开以当前光标下单词为名的文件(应该是在当前路径下查找)
!ls -l	在外部terminal临时执行一下ls -l
:10,$ w test.cpp	取行10到最后一行内容保存到test.cpp
:r test.cpp			将test.cpp内容粘贴到当前光标处
:h(:help)			显示帮助(ctrl+w,q退出帮助窗口)
```

### 操作:

```
:abbr hw hello world	输入hw再输入结束符会用全名替代(和autohotkey的热字串类似, 同样需要结束符来结束)

记录宏:
qa	开始记录宏a
q	结束记录
@a	应用宏a
(包括移动操作也会被记录)

"x+c/d/y操作
"x注册剪贴板,然后"xp粘贴出来(如"ay$将到行尾的字符复制到剪贴板并标记为a,然后"ap粘贴出标记为a的剪贴板内容)
(这里"指命令,不是字面意思的引号)
```

结束符指的是空格，换行，符号，退出当前编辑模式，任何表示已经没有正常输入该单词的字符或者命令都叫结束符
怎样删除该缩写，当然最简单的就是比如abbr: hw helloworld要删除的话就是abbr: hw hw，当然有没有更好的方式，查一下


### 常用组合:

	dd,p	下移当前行
	k,dd,p	上移当前行
### 进入插入模式后:

```
ctrl+w/u		删除光标前面的一个单词/前面的所有字符，这个与emacs一样
ctrl+n/ctrl+p	从提示框的上面/下面开始选择完成单词(连续键入则会向下/向上切换)
ctrl+o			临时进入命令模式
```


### 编辑:


	y(yank)			仅复制
	d(delete)		删除并复制
	c(change)		删除并复制并进入插入模式
	
	dw				删除单词(删除光标后部分单词)
	daw				删除单词(整个单词)
	d4w/d$/d^
	
	d2j/d2k			向下/向上删除2行
	y2j/y2k
	
	2yy				复制后2行
	不容易得出行数时:
		开始行 输入ma		做一个a标记
	    结束行 输入y'a/d'a	复制/删除开始行到结束行(不是开始到结束位置,操作的是行)
	(:10,20y/:10,20d 这样也可以)
	
	p/P/2p			粘贴到光标前/光标后/粘贴2次
	
	i/a			当前光标前/后插入
	I/A			当前行首/尾插入
	o/O			在当前行上面/下面新起一行
	
	x/X			删除光标处/光标处前1位字符
	s/S			删除光标处字符/光标所处行
	
	会进入插入模式的命令全部有a/A/i/I/s/S/c/C/o/O
	
	r			按r后，键入一个字符，光标处字符会替换为键入字符
	3r			按3r后，键入一个字符，光标处向后3个字符会替换为键入字符
	R			进入替换模式，连续键入字符会在当前行不断向后替换光标处的字符，即使末尾已经没有字符了，这时候也会像替换光标处空字符一样不断向后插入键入的字符，而且替换字符不会换行，始终都在当前行。
	
	J/2J		删除当前行末尾换行符使下一/2行合并到当前行
	
	~			切换当前英文字符的大小写（切换，不是转大写），切换后光标移到下一字符。如果为非英文，则只移动光标位置
	
	=/==		格式化选区/当前行
	
	>/<			indent/unindent选区
	>>/<<		indent/unindent本行
	2>>			缩进下面2行
	:10,20>>	缩进10行到20行

- 输入:进入末行模式，再输入2,3>>然后再回车，也就是:2,3>>，就会使2到3行的文本向后缩进一次（当然一次缩进的空格多少可以在配置文件中设置，参见后文）
- 用esc/ctrl+[或者ctrl+c退出插入模式后，都会使光标位置向前挪一位

> 操作个数与操作命令很多时候位置可以互换,比如y2l也可以为2yl,但比如5x不能为x5,因为x命令本身已经执行了操作

> 重复命令代表操作当前行,比如dd,<<,yy,cc,==,


|             |  更改c  |  删除d  |  复制y  |
| :---------: | :-----: | :-----: | :-----: |
|  到单词尾   |   cw    |   dw    |   yw    |
|  到单词尾   |  ce/b   |  de/b   |  ye/b   |
|  到单词尾   |  cE/B   |  dE/B   |  yE/B   |
|  整个单词   |   caw   |   daw   |   yaw   |
| 向后2个单词 | 2cw/c2w | 2dw/d2w | 2yw/y2w |
| 向前2个单词 | 2cb/c2b | 2db/d2b | 2yb/y2b |
|   一整行    |   cc    |   dd    |  yy/Y   |
|   到行尾    |  c$/C   |  d$/D   |   y$    |
|   到行首    |   c0    |   d0    |   y0    |
|  单个字符   |    r    |   x/X   |  yl/yh  |
|   2个字符   |   2s    |   2x    |   2yl   |


### 查找:

	:s/str1/str2/g			替换当前行str1为str2
	:%s/str1/str2/g			替换每一行str1为str2
	:10,20s/str1/str2/g 	替换从10行到20行所有str1为str2(如果不加/g则只会替换每一行第一个匹配项)
	:%s/^\n$//g 			删除空行
	:g/kw/d 				删除包含kw字符串的行
	
	/str		查找str,然后可通过n/N查找上一个/下一个
	?str		反向查找
	d/str		向后删除到str(不删str)
	d?str		向前(删除str)
	
	fx/Fx		向右/向左跳到本行字符x处(x可以是任意字符,是字符,不能输入单词)
	tx/Tx		区别是跳到字符x的前后位置
	(使用逗号,可以反向)
	
	*/#			查找并移动到下一个/上一个光标所在单词
	
	n/N			查找中向后/向前导航

### 移动:

```
h,j,k,l			左/下/上/右移动光标

backspace/space	光标前进/后退

enter	光标移动到下一行语句首位置
+/-		移动到下一行/上一行的行首
^/0		光标移动到语句首/行首
$/3$	光标移动到行尾/3行后的行尾(行首没有这个用法)

11G		跳转到11行
20|		移动到20列

11%		跳转到文档的11%处(ctrl+g 显示当前百分比文档位置)

gg/G	文件头/文件尾

H/M/L	光标移动到当前屏幕的上/中/下位置

%		移动到匹配括号处

``		可在当前位置与上一次导航位置之间切换(上下左右移动不能算作导航,必须是执行了导航操作才算)

mx		做标记x
`x		移动到x标记处
'x		移动到x标记处的行首


fx/Fx		向右/向左跳到本行字符x处(x可以是任意字符,是字符,不能输入单词)
tx/Tx		区别是跳到字符x的前后位置
(使用逗号,可以反向)

*/#			查找并移动到下一个/上一个光标所在单词

n/N			查找中向后/向前导航
```

> <u>/查找模式</u>或者<u>:末行模式</u>都可以使用上下键翻到历史


{/}		如果当前光标没有在空行上，光标会向前/向后跳过中间非空行来到上一个/下一个新空行，
		如果当前光标已经处在空行，则光标会向前/向后跳过相邻空行和中间非空行来到上一个/下一个新空行
空行指没有内容的行，包括不能有空格或者tab(即只含有一个不可见的换行符\n)


### 视图移动:

```
ctrl+e/y	向上/向下滚动一行(extra/yield line即向下额外获取一行/向上退让一行)(可在输入命令前输入数字，表示执行几次本操作)
ctrl+u/d	向上/向下滚动半屏(up/down)
ctrl+b/f	向上/向下滚动一屏(backword/forward)
上面3组命令在视图移动时，通常光标在当前视图中的第几行是不变的
(视图移动时光标会在所在行的句首，不是行首)，
在视图滚动到文件尾或首不能滚动等情况时，光标会在当前视图行间移动。

zt/zz/zb	将当前行移动到屏幕的顶部/中部/底部位置(top/zz/bottom)
(光标会随之移动，且在行中的位置不变)
(顶部/底部，不指顶端/底端，一般在顶端下方/底端上方6行的位置)

H/M/L		光标移动到当前屏幕的高/中/低位置(high/middle/low)
(高/低位置一般在顶端下方/底端上方6行的位置)
```

### 单词头/尾:
```
w    光标跳到下一个单词头(标点符号算作单独的单词)(word)
b    光标跳到当前单词的词头，如果已经处在当前单词的词头，就会跳到上一个单词的词头(beginning)
e    光标跳到当前单词的词尾，如果已经处在当前单词的词尾，就会跳到下一个单词的词尾(ending)

其中大写W/B/E表示标点符号不算作单独的单词，单词只以空格分隔。
```


h,j,k,l同←↓↑→键是一样的效果，在vim中←→键或者h,l键只能在当前行移动，不能移动到其它行。↓↑键或者j,k键是在当前列中上下移动。这些行为是与vscode不同的。
backspace  在vim中会使光标在文档中逐个字符向前移动，类似vscode中按←键。
space  与backspace效果相反
enter  光标移动到下一行句首(不是行首)

### 使用w命令对下列不同文本进行光标移动，考察w命令的行为。

> w/b/e的行为是相似的

1. 标点符号可以看作单独的单词
   ```
   aa,bb cc\";dd-ee ff
   ```

1. 单词通常指\w也就是\[A-Za-z0-9_]，  
(但在vim中不严格是这样，部分语言集的字符同样可以和\w的字符组成单词)
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



> 可以通过在vim中鼠标选区(可视模式选择不行)再按ctrl+shift+c讲文本复制出来(内部yanked不能复制到外部),也可以在外部复制了,在vim中按ctrl+shift+v粘贴进去
>

### 分屏:

	shell里分屏打开文件
	vim -on file1 file2...
	vim -On file1 file2...
	
	ctrl+w,n		创建空白内容的分屏
	
	打开文件作为分屏
	:vsp filename	垂直
	:sp filename	水平
	
	打开当前文件作为分屏
	ctrl+w,s		水平
	ctrl+w,v		垂直


    关闭分屏
    ctrl+w,o		关闭其它分屏,只保留当前分屏
    ctrl+w,c		关闭当前分屏
    
    切换分屏
    ctrl+w,w		分屏之间逐个切换
    ctrl+w,h/j/k/l	切换到h,j,k,l位置

### 可视模式(也就是选择模式):


	v/V		可视模式/以行为单位选择模式	选择模式(上下左右进行选择)
	ctrl+v	可视块模式	块选择模式
	
	进入可视模式过后:
	    如果光标在括号处的话 %选择括号之间的内容
	    (也就是选择当前光标到导航位置之间的区域,可视块模式也一样,只不过是垂直块选择了)
	
	进入可视块模式过后:
	    c,y,d可用,c相当于替换,命令复制到剪贴板中的多行内容可以p粘贴出来
	    I为在多行中插入,要使多行插入生效需退出可视模式
	
	(退出可视块/可视模式/末行模式等有一点延时,若要立即退出就esc,esc)

### 配置文件:

```
备份	sudo cp /etc/vim/vimrc /etc/vim/vimrc.backup
修改	sudo vim /etc/vim/vimrc

添加项:
set cursorline		"突出显示当前行
set shiftwidth=4	"设定<<,>>移动的宽度
set tabstop=4		"设定tab的长度为4
set incsearch		"输入搜索内容时就显示搜索结果
set hlsearch		"高亮显示搜索文本
set smartindent		"开启新行时自动缩进
set mouse=iv		"在进入插入模式后用鼠标选择为可视选择模式

其中smartindent已经不被推荐使用了

其中set mouse=iv,在进入插入模式后用鼠标选择为可视选择模式,这样可以点击输入地点就可以输入而且还可以鼠标选择可视区域,回到命令模式后又可以使用ctrl+shift+c复制,详细文档为(:h 'mouse')

其它项目:
syntax on			"开启语法高亮
set number			"显示行号
set ignorecase		"搜索时忽略大小写
set smartcase		"搜索时在有一个或以上大写字母时保持对大小写敏感
set softtabstop=4	"按退格键时可以一次删掉4个空格

其中syntax on可以不用写了，现在在vimrc中默认就有下列设置
if has("syntax")
  syntax on
endif
也就是只要文件类型有syntax就会自动开启，所以不用自己显示再设置了

vimrc文件默认推荐项，但默认都是被注释了的。
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
```
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden			" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
```

末行可设置项:
:set number/nonumber		显示/关闭行号
:set hlsearch/nohlsearch	设置/关闭高亮显示查找结果
要想知道某个命令的简写或怎么关闭某个命令,请查看文档如(:h 'ignorecase')
```

自动匹配括号：
```
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i
```

# 让vim中的tab为4个空格
使其与vscode一致(vscode默认tab为4个空格)

stackoverflow上的回答
As has been pointed out in a couple of other answers, the preferred method now is NOT to use smartindent, but instead use the following (in your .vimrc):
```
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
```
第一句`filetype plugin indent on`在vimrc文件中默认就在，只不过被注释掉了。
原文为：
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

### 独立vim(非terminal vim)

不可以:

- ``不可以返回上次位置
  ctrl+v/z/n/u/p/f/b/g...不可以，这些都对应的是编辑器的操作，而不能对应到vim的指令
- 不能存缩写
- 不可以进入可视块模式ctrl+v
- 不能使用%跳到匹配括号处

可以:

- 可以录制宏
- 可以做标记
- 可以进入末行模式
- 可以使用/或?进行查找