# 读前须知
本文作者：[jack518](https://www.jack518.com/)
<br>文章GitHub地址：[链接](https://github.com/baofengyujue/jupc/blob/main/markdown.md)
<br>引用请注明出处。


## 注意/说明
- 本文是在vscode环境中撰写的，所以部分内容有关vscode设置，请注意辨别
- 本文部分markdown元素vscode原生预览并不支持显示，要想支持请先安装下述vscode插件
- 本文中部分markdown特性是是针对特定markdown实现的，比如GitHub支持风格的markdown
- 本文原文阅读起来可能会很吃力，最佳实践是将实时预览打开。在vscode中预览的方式参考下述
- 本文不是严格按照循序渐进的方式介绍的，比如list里面会有“通过格式输出代码块的内容”，请注意区分
- 部分语法都是等效的，比如fenced code block的波浪号\~~~或者反撇号\```都可以，再比如list里的\-或者\+都可以，我们自己用其中一个顺手的就行了，之所以都展示出来是因为你以后看到了要知道，当然可能很多同样作用的语法也没有在本文列举出来

## 在vscode中预览markdown文件三种方式：
- 在markdown文件标签卡上右键，然后点击`Open Preview`
- 或者在编辑器右上角放大镜分页图标（其快捷键为<kbd>ctrl+k,v</kbd>），点击即可
- 或者直接快捷键<kbd>ctrl+shift+v</kbd>打开预览

## 关于插件
要想本文所有元素都能在vscode预览中正确显示，需安装下面vscode插件：
- yzhang.markdown-all-in-one
- bierner.markdown-footnotes
- bierner.markdown-emoji

一些功能是属于插件的，比如：本来vscode中输入列表-，或者引用>后换行，都不会自动输入一个列表符-或引用符>，是在安装了插件Markdown All in One后才有的功能


- [读前须知](#读前须知)
  - [注意/说明](#注意说明)
  - [在vscode中预览markdown文件三种方式：](#在vscode中预览markdown文件三种方式)
  - [关于插件](#关于插件)
- [关于换行](#关于换行)
- [head](#head)
  - [head](#head-1)
    - [head](#head-2)
          - [head](#head-3)
- [format](#format)
- [list](#list)
  - [horizontal rules](#horizontal-rules)
- [blockquote](#blockquote)
- [code block](#code-block)
  - [fenced code block](#fenced-code-block)
  - [通过格式输出代码块](#通过格式输出代码块)
  - [inline code block](#inline-code-block)
- [math block](#math-block)
- [task list](#task-list)
- [table](#table)
- [link](#link)
  - [图片链接](#图片链接)
  - [相当于此img标签](#相当于此img标签)
  - [图片引用链接](#图片引用链接)
  - [不支持本地路径：](#不支持本地路径)
  - [引用链接](#引用链接)
- [锚点](#锚点)
    - [some header blah](#some-header-blah)
- [footnotes](#footnotes)
- [转义符号](#转义符号)
    - [注册商标的转义例子&reg;](#注册商标的转义例子)
- [表情](#表情)
  - [跳转到锚点](#跳转到锚点)
- [关于table of contents](#关于table-of-contents)
  - [1. aa](#1-aa)
    - [1.1. aaa](#11-aaa)
    - [1.2. bb](#12-bb)
      - [1.2.1. rrr](#121-rrr)
      - [1.2.2. xx](#122-xx)
- [embed html tag](#embed-html-tag)
- [其它](#其它)
- [本文部分引用自](#本文部分引用自)

# 关于换行

- 多次换行并不会换行

你


好
- 甚至单次换行都不算换行只算一个空格，至少间隔一空行

是我的

是
我
的

吗？

- 可以使用\<br>强制换行

是我<br>的吗

是我

的吗

- \<br>换行和空行换行还是有区别的
- 总结：markdown解析器会将挨着的两行文字放在同一个html标签中（即挨着的两段普通文字在一个p标签内，在-列表下一行的文字在一个li标签内），所以不管中间有多少空格都只会被解析为一个空格，只有中间空出来一行，才会将第二段文字解析到另一个html标签中，所以这就解释了为什么空一行换行和\<br>换行换行间隔不一样，因为空一行换行第二段文字在一个新的p标签里了，所以就有了外边距，而\<br>换行只是在一个p标签内换行而已。
- 尽量保证文本结构清晰，别什么段落都黏在一起，促成我们养成好习惯。爱咋换行咋换，试试就知道了

- 行尾有两个空格也算作一个换行\<br>（不是段落\<p>）


# head#
## head##
### head###
...
###### head######

# format

*italic*  
_italic_  
**bold**  
__bold__  
~~strikethrough~~  



# list

`数字+点`后至少接一个空格数字列表才能生效，而且一个数字列表中数字显示的顺序是依次的，会忽略自定义的数字

1.你好
2.世界
3.hello
4.world

2. 你好
2. 世界
7. hello
9. world



1. 你好
    1. 世界
    2. hello

可以看出中间即使空出多行，数字列表仍然生效，所以要想新开数字列表需要中间插入点内容


*biu~
* biu~
+ biu~biu~
- biu~biu~biu~

<hr>

1. 你好
2. hello
    - 世界
    - world

横线+空格即`- `后有4个空格就可以使ccc显示为块了

- aaa
-   bbb
-     ccc
- ddd
eee
- fff

## horizontal rules
hyphen,asterik

---
-----
*****
_____
<hr>


# blockquote

> blockquote
this is second line

> here i am
> - nested lists
> - good looking

>first level
>>second level
>>>third level

>>first second level

>i can work every day!
>'cause i'm a diligent man
>yeah,believe it or not..

> ## This is a header.
> 
> 1. his is the first list item.
> 2. This is the second list item.
> 
> Here's some example code:
> 
>     return arr.push('*');




# code block
## fenced code block

波浪线\~和反撇号\`都可以，但尽量使用反撇号\`

```
there are some block contents
```

```javascript
    let x = 7;
    console.log(x+8);
```
```js
    let x = 7;
    console.log(x+8);
```
~~~js
    let x = 7;
    console.log(x+8);
~~~
~~~css
#app{
    width:1000px;
}
~~~
```php
$x=6;
$y=9;
echo "${x+y}"
```

## 通过格式输出代码块
也可以通过格式输出代码块，但不建议这么做！有可能会导致结构不清晰
<p style="color: red;">hello markdown!</p>

    <p style="color: red;">hello markdown!</p>

    <p style="color: red;">hello markdown!</p>
与前面内容间隔一行，再tab一次就是块了

    你好世界！
后面的内容正常书写，不用间隔一行，但为了书写的美观建议还是再间隔一行，不要像这一行这样

## inline code block
单\`或者双\`\`都是一样的，都相当于code标签

`let x=8;`
``let y=9;``

<code>const PI = 3.1415926;</code>


# math block
给定方程$f(x)=x^2+y^2$

给定方程$$f(x)=x^2+y^2$$

$$
f(x)=x^2+y^2
$$

# task list
原生不支持task list,注意这里是字母x不是乘号*  
在vscode插件Markdown All in One中输入乘号*是格式不正确的

- [x] task 1
- [*] task 2
- [ ] task 3

# table

| First Header                | Second Header                |
| --------------------------- | ---------------------------- |
| Content from cell 1         | Content from cell 2          |
| Content in the first column | Content in the second column |

| Syntax    | Description |   Test Text |
| :-------- | :---------: | ----------: |
| Header    |    Title    | Here's this |
| Paragraph |    Text     |    And more |

:---左对齐，:---:居中，---:右对齐


# link
后面的`Jack W.`为a标签(对于图片也适用)的title属性，可以没有

[jack518](http://jack518.com 'Jack W.')


title属性要么不加，要加就必须在引号里面，不然格式错误
## 图片链接
![打不开显示我](https://static.adidas.com.cn/images/logo-new.png 'adidas')

## 相当于此img标签
<img src="https://static.adidas.com.cn/images/logo-new.png" alt="打不开显示我" title="adidas">

## 图片引用链接
![alt][i1]

[i1]:https://static.adidas.com.cn/images/logo-new.png

## 不支持本地路径：
![jack518](/home/jack518/Pictures/jack518.png)

## 引用链接
vscode默认是支持引用链接的

[张三丰][1]
[jack518][jw]
[武当][2]

[1]:http://jack518.com
[jw]:https://jack518.com
[2]:https://wudang.com '武当官网'


# 锚点
到“跳转到锚点”部分点击链接跳转到此处

some anchor below here

<a id="tohere"></a>
<a id="hi-there"></a>
<a id="hello_there"></a>

下面header下文会有链接跳转于此

### some header blah

# footnotes
vscode默认不支持脚注footnotes，需要安装Matt Bierner的插件`Markdown Footnotes`才可以

I have more  to say up here[^1]

something else to say[^2]

something else to say [^2]

something else to say   [^2]

I have more [^1] to say up here.
and more[^1] and more[^1]

something new[^new]

something old[^old]

百度[^baidu]
谷歌[^google]


注意：注脚内容被放到了文档的最底部

[^1]: To say down here.
[^2]: go to something else.
[^new]: this is the new thing
[^old]: this is the old thing
[^baidu]: https://baidu.com
[^google]: https://google.com



# 转义符号

Coca Cola<sup>&reg;</sup>

### 注册商标的转义例子&reg;

UNICODE     U+000AE

HEX CODE    &#xae;

HTML CODE   &#174;

HTML ENTITY &reg;

CSS CODE    \00AE


# 表情
需要安装Matt Biener的vscode插件`Markdown Emoji`
:smile:
:joy:
:blush:
:zzz:
:sad:
:happy:
`:joy:`
`:smile:`

一些[emoji shortcode](https://gist.github.com/rxaviers/7360908)

最好是直接输入(win10中按<kbd>win+;</kbd>可直接输入表情)，  
不要用shortcode(因为很多表情shortcode中没有)，比如：

😁😸😎🧡💛💗💤⛔💯🏀💊🍇🍉🍜🍕🍔✈🚀🐘🐈👩👌🙏🎸🧲

要注意将文档保存为UTF-8格式

## 跳转到锚点
包括自定义锚点和标题锚点

下面两种方式都能访问到tohere锚点，说明下划线被解析去掉了

[#tohere](#tohere)

[#to_he_re](#to_he_re)

[#hi-there](#hi-there)

锚点id不要有下划线，不然不能跳转

[#hello_there](#hello_there)

header标题可以直接跳转，空格以连字符代替

[跳转到some header](#some-header-blah)


# 关于table of contents

vscode原生预览中并不支持\[TOC]

[TOC]

下面是关于`markdown all in one`vscode插件中table of contents的介绍

- [1. aa](#1-aa)
  - [1.1. aaa](#11-aaa)
  - [1.2. bb](#12-bb)
    - [1.2.1. rrr](#121-rrr)
    - [1.2.2. xx](#122-xx)

## 1. aa
### 1.1. aaa
### 1.2. bb
#### 1.2.1. rrr
#### 1.2.2. xx
The TOC is automatically updated on file save by default.  
TOC默认会在文件保存时自动更新。

对于`markdown all in one`之vscode插件，按<kbd>ctrl+shift+p</kbd>输入section就有add/update section numbers
输入table就有create table of contents

# embed html tag
一些在markdown文档中嵌入的html标签

<kbd>shift+i</kbd>

Coca Cola<sup>&reg;</sup>

<table>
    <tr>
        <th>name</th>
        <th>age</th>
    </tr>
        <tr>
        <td>Jack</td>
        <td>25</td>
    </tr>
    <tr>
        <td>HanRong</td>
        <td>18</td>
    </tr>
</table>

<a href='https://www.ruanyifeng.com/blog/'>阮一峰</a>&copy;

<img src='https://www.ruanyifeng.com/blog/images/person2_s.jpg'>

<p style="color: red;">hello markdown!</p>


# 其它

- github中的markdown里面的链接两边最好留一空格，不然链接会将后面文字也包含进来


# 本文部分引用自
some contents of above reference from:
- https://daringfireball.net/projects/markdown/syntax
- https://wordpress.com/support/markdown-quick-reference/
- https://www.markdownguide.org/extended-syntax/

