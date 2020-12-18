在vscode中预览markdown文件，需要在markdown文件标签卡上右键，
然后点击`Open Preview`

或者直接快捷键<kbd>ctrl+shift+v</kbd>打开预览

[TOC]


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


Coca Cola<sup>&reg;</sup>

<p style="color: red;">hello markdown!</p>
    
    <p style="color: red;">hello markdown!</p>

与前面内容间隔一行，再tab一次就是块了

    你好世界！
后面的内容正常书写，不用间隔一行，但为了书写的美观建议还是再间隔一行，不要像这里这样



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
- 总结：尽量保证文本结构清晰，别什么段落都黏在一起，促成我们养成好习惯。爱咋换行咋换，试试就知道了


# head#
## head##
### head###
...
###### head######


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

数字+点后至少接一个空格数字列表才能生效，而且一个数字列表中数字显示的顺序是依次的，会忽略自定义的数字

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

空格,1tab,2tab

- aaa
-   bbb
-       ccc
- ddd
eee
- fff


hyphen,asterik

---
-----
*****
_____
<hr>

后面的`Jack W.`为a标签的title属性，可以没有

[jack518](http://jack518.com 'Jack W.')


*italic*
**bold**
_italic_
__bold__

单\`或者双\`\`都是一样的，都相当于code标签

`let x=8;`
``let y=9;``

<code>const PI = 3.1415926;</code>

<kbd>shift+i</kbd>

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

原生不支持task list,注意这里是字母x不是乘号*
在vscode插件Markdown All in One中输入乘号*是格式不正确的

- [x] task 1
- [*] task 2
- [ ] task 3



First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

title属性要么不加，要加就必须在引号里面，不然格式错误，图片都不解析了

![打不开显示我](https://static.adidas.com.cn/images/logo-new.png 'adidas')
ref
![alt][i1]
img
<img src="https://static.adidas.com.cn/images/logo-new.png" alt="打不开显示我" title="adidas">

不支持本地路径：
![jack518](/home/jack518/Pictures/jack518.png)

引用链接
vscode默认是支持引用链接的
[张三丰][1]
[jack518][jw]
[武当][2]


[1]:http://jack518.com
[jw]:http://jack518.com
[2]:https://wudang.com '武当官网'

[i1]:https://static.adidas.com.cn/images/logo-new.png



Markdown
:  Text-to-HTML conversion tool

vscode默认不支持脚注footnotes，需要安装插件`Markdown Footnotes`才可以
I have more  to say up here.[^22]
[^22]: to say down here

	
I have more [^1] to say up here.

[^1]: To say down here.

some contents of above comes from:
- https://daringfireball.net/projects/markdown/syntax
- https://wordpress.com/support/markdown-quick-reference/





UNICODE     U+000AE
HEX CODE    &#xae;
HTML CODE   &#174;
HTML ENTITY &reg;
CSS CODE    \00AE