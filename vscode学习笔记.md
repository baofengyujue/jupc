## a



| 快捷键                          | 效果                                          | 是否为默认 |
| ------------------------------- | --------------------------------------------- | ---- |
| <kbd>alt+shift+鼠标拖选</kbd>   | 列选模式                                      |是
| <kbd>alt+鼠标各处点击</kbd>     | 多光标模式                                    |
| <kbd>alt+鼠标各处选择文本</kbd> | 多光标选择模式                                |
| <kbd>ctrl+shift+L</kbd>         | 选择一段文本，执行快捷键，选择所有相同的文本  |
| <kbd>alt+shift+i</kbd>          | 选择一段文本，执行快捷键，在所有行行尾添加光标 |
| <kbd>ctrl+k,ctrl+x</kbd>        | 选择一段文本，将选中文本中末尾的空格去掉     |
| <kbd>ctrl+L</kbd>               | 选择所选区域的行                              |




<kbd>ctrl+shift+up/down</kbd>在intellij里默认是上下移动语句(vscode中intellij插件中为上下移动行)
现在在两个编辑器中都将其设置为上下添加光标，
- 在intellij中，keymap中搜索caret，找到clone caret above/below，录入<kbd>ctrl+shift+up/down</kbd>，然后会提示是否删除绑定在该快捷键的其它命令，选择remove
- 在vscode中，<kbd>ctrl+shift+up/down</kbd>本来就是add cursor above/below所以只需要查看该快捷键绑定的
  命令，然后在intellij插件命令上移除该快捷键，此时`keybindings.json`文件中会出现
  ```json
    {
        "key": "ctrl+shift+up",
        "command": "-editor.action.moveLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
  ```
  意为移除该快捷键在intellij插件上绑定的命令
  但是像有些intellij插件绑定的快捷键移除了会有问题，比如移除插件ctrl+e绑定的命令过后会出现
  `command "-workbench.action.openRecent" not found`的提示
  此时`keybindings.json`内是这样的
  ```json
    {
        "key": "ctrl+e",
        "command": "-workbench.action.openRecent"
    }
  ```
  这时只能在用户`keybindings.json`文件中定义一个和默认该快捷键定义重复的一个定义即：
  ```json
    {
        "key": "ctrl+e",
        "command": "workbench.action.quickOpen"
    }
  ```
  这时快捷键才会生效。所以由此上面的<kbd>ctrl+shift+up/down</kbd>快捷键也可以采用这种用户设置覆盖的方式，
  而且用户设置肯定优先级最高，用户快捷键注册了，就不会往后面的插件到默认中去搜索此快捷键命令了，
  而且插件中对<kbd>ctrl+shift+up/down</kbd>快捷键的when参数为`editorTextFocus && !editorReadonly`还要
  比默认的`editorTextFocus`作用域小，所以更不会往后查找此快捷键的注册命令了。因此
  `keybindings.json`文件中的设置实际上为：
  ```json
    {
        "key": "ctrl+shift+up",
        "command": "editor.action.insertCursorAbove",
        "when": "editorTextFocus"
    },
  ```
  找默认设置copy来的。当然是添加用户设置覆盖插件快捷键设置，还是移除插件快捷键设置，
  要看心情和实际效果~😁，怎么方便怎么来。

  原本想<kbd>ctrl+3</kbd>的快捷键只在markdown文件下生效，所以就写了如下配置，
  ```json
    {
        "key": "ctrl+3",
        "command": "editor.action.insertSnippet",
        "when": "editorHasSelection",
        "args": {
            "langId": "markdown",
            "name": "kbd keybinding"
        }
    },
  ```
  并在snippet配置文件`markdown.json`中写了如下配置，
  ```json
  	"kbd keybinding":{
		"prefix": "a",
		"body": "<kbd>$TM_SELECTED_TEXT</kbd>"
	}
  ```
  （注意上面没有prefix域的话，该snippet根本就不会起效，所以加了个prefix）
  但是，这样配置并不起效，在js文件中同样可以使用这个快捷键，再一看keybindings的官方介绍文档
  也没有对作用域scope进行说明，只对配置自定义snippet有作用域的介绍，这说明快捷键就不应该有对
  作用域的要求


ctrl+shift+\:在intellij中没有定义，在vscode中是go to matching bracket,此功能在intellij中的快捷键为ctrl+shift+m,此快捷键在vscode中功能为view:toggle problems

vscode和intellij都没有置换选区光标位置的快捷键

ctrl+[/]在intellij中为move caret to block start/end，在vscode中为unindent/indent
ctrl+shift+[/]在intellij为move caret to block start/end with selection，在vscode中为fold/unfold

set selection anchor <kbd>ctrl+k,ctrl+b</kbd>
select from anchor to cursor<kbd>ctrl+k,ctrl+k</kbd>
cancel selection anchor<kbd>esc</kbd>用<kbd>ctrl+k,ctrl+b</kbd>选择过后默认就取消了