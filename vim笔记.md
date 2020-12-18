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
	
	dw				删除单词(光标后部分)
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
	
	x/X/2x/2X	删除光标处后1位/前1位字符
	s/S/3s		删除当前字符/当前行
	
	会进入插入模式的命令全部有a/A/i/I/s/S/c/C/o/O
	
	r/3r		替换1个字符
	R			替换模式
	
	J/2J		删除换行符使下1行合并上来
	
	~			切换选区/当前字符的大小写
	
	=/==		格式化选区/当前行
	
	>/<			indent/unindent选区
	>>/<<		indent/unindent本行
	2>>			缩进下面2行
	:10,20>>	缩进10行到20行


> 操作个数与操作命令很多时候位置可以互换,比如y2l也可以为2yl,但比如5x不能为x5,因为x命令本身已经执行了操作

> 重复命令代表操作当前行,比如dd,<<,yy,cc,==,


|        |   更改c   |   删除d   |   复制y   |
| :----: | :-----: | :-----: | :-----: |
|  到单词尾  |   cw    |   dw    |   yw    |
|  到单词尾  |  ce/b   |  de/b   |  ye/b   |
|  到单词尾  |  cE/B   |  dE/B   |  yE/B   |
|  整个单词  |   caw   |   daw   |   yaw   |
| 向后2个单词 | 2cw/c2w | 2dw/d2w | 2yw/y2w |
| 向前2个单词 | 2cb/c2b | 2db/d2b | 2yb/y2b |
|  一整行   |   cc    |   dd    |  yy/Y   |
|  到行尾   |  c$/C   |  d$/D   |   y$    |
|  到行首   |   c0    |   d0    |   y0    |
|  单个字符  |    r    |   x/X   |  yl/yh  |
|  2个字符  |   2s    |   2x    |   2yl   |


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

{/}		移动到上一个/下一个空白区域首位置

fx/Fx		向右/向左跳到本行字符x处(x可以是任意字符,是字符,不能输入单词)
tx/Tx		区别是跳到字符x的前后位置
(使用逗号,可以反向)

*/#			查找并移动到下一个/上一个光标所在单词

n/N			查找中向后/向前导航
```

> <u>/查找模式</u>或者<u>:末行模式</u>都可以使用上下键翻到历史

### 视图移动:

```
ctrl+u/d	向上/向下滚动半屏(up/down)
ctrl+e/y	向上/向下滚动一行
ctrl+b/f	向上/向下滚动一屏(backword/forward)

zz/zt/zb	将当前行移动到屏幕的中间/顶部/底部

H/M/L		光标移动到当前屏幕的上/中/下位置
```

### 单词头/尾:


```
e/b		移动到单词的结尾/开始位置
E/B		分隔不同
w/W		移动到下一个单词头

aa,bb cc\";dd-ee ff
光标从第一个a移动到:
w->,
w->第一个b
w->第一个c
w->\
w->第一个d
w->-
w->第一个e
w->第一个f

光标从第一个a移动到:
W->第一个c
W->第一个f

所以:
小写字母,标点符号视作独立的单词
大写字母,标点符号视作单词的一部分
```

> 小写会包括以标点符号分隔单词,大写只以空格分隔

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

更改项:
set cursorline		"突出显示当前行
set shiftwidth=4	"设定<<,>>移动的宽度
set tabstop=4		"设定tab的长度为4
set incsearch		"输入搜索内容时就显示搜索结果
set hlsearch		"高亮显示搜索文本
set smartindent		"开启新行时自动缩进
set mouse=iv		"在进入插入模式后用鼠标选择为可视选择模式

iv,在进入插入模式后用鼠标选择为可视选择模式,这样可以点击输入地点就可以输入而且还可以鼠标选择可视区域,回到命令模式后又可以使用ctrl+shift+c复制,详细文档为(:h 'mouse')

保留项:
syntax on			"开启语法高亮
set number			"显示行号
set ignorecase		"搜索时忽略大小写
set smartcase		"搜索时在有一个或以上大写字母时保持对大小写敏感
set softtabstop=4	"按退格键时可以一次删掉4个空格

默认推荐项:
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden			" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

末行设置项:
:set number/nonumber		显示/关闭行号
:set hlsearch/nohlsearch	设置/关闭高亮显示查找结果
要想知道某个命令的简写或怎么关闭某个命令,请查看文档如(:h 'ignorecase')
```
```
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i
```
### 独立vim(非terminal vim)

可以:

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