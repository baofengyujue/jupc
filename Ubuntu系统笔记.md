

## 安装haroopad
1. 官网下载deb包
2. 安装


## 安装搜狗输入法
1. 官网下载deb包

2. 安装依赖项
  `sudo apt-get install -f`
    或者
  `sudo apt install libopencc1 fcitx-libs fcitx-libs-qt`
    第一个什么都安装，第二个只安装特定的

3. 安装搜狗
  `sudo dpkg -i sogoupinyin_2.0.0.0078_amd64.deb`

4. Settings->Language Support->~~增加汉语（需要联网）~~（增加汉语似乎是没有必要的），并修改Keyboard input method system为fcitx（这个必要，不然不能切换）

5. Settings->Text Entry->增加sougou pingyin，然后选择sougou pinyin(fcitx)，点击右下角设置图标，在打开的'input method configuration'窗口中去掉其它不必要的输入法，只留下english和sougou

6. 重启系统（注销不会生效）

7. ctrl+space即可切换输入法

8. 默认会有两个输入法图标显示在工具栏（不能通过设置去除掉）
  - 找到fcitx-qimpanel的pid
  ```
    ps -aux | grep fcitx-qimpanel
    返回
    jw 2137 1496 0 10:36 ? 00:00:00 fcitx-qimpanel
  ```
    - kill掉
    ```
    sudo kill -9 2137
    ```
    这样就只有一个图标了
    似乎可以不加sudo，但会出现一个no such process可能是已经被杀死了

    - 但是每次都来执行一遍显然不方便，所以将其开机启动
    ```
    sudo vim /etc/rc.local
    ```
    添加
    ```
    /bin/ps -ef | grep fcitx-qimpanel | grep -v grep | awk '{print $2}' | xargs kill -9

  exit 0
    ```
    *实测无效，可能是开机过后需要等一会再执行才行*

  ​

  **如何重启搜狗**

  运行

  ```shell
  ps -x | grep qim
  ```

  得到结果

  ```
  3009 ?        Sl     0:00 /usr/bin/sogou-qimpanel
  3395 pts/1    S+     0:00 grep --color=auto qim
  ```


  这里/usr/bin/sogou-qimpanel就是搜狗进程的执行文件

  如果搜狗工作不正常，重启搜狗就行了

  ```shell
  sudo kill -9 3009

  启动搜狗
  /usr/bin/sogou-qimpanel
  ```

## 炸

- 可在Ubuntu Software里面搜索下载dconf editor，其功能类似Windows的注册表，可以更改几乎所有系统设置，配置项，不过一般用不到
- 命令行中输入路径区分大小写
- 移动窗口使窗口不为全屏模式拖动的是最顶部工具栏（就是显示时间的那个条）
- 安装搜狗输入法后按shift不会自动将输入上屏，可在设置->按键->中英文切换->切换英文状态时，保留...这个复选框取消选择再应用，重新生效一下才可以
- 默认ctrl+.为搜狗输入法切换中英文标点的快捷键

下载安装步骤：

    - pypi中下载
    - tar -zxvf 下载的压缩包
    - cd 进入解压后的目录
    - sudo python3 setup.py install安装

安装pillow:

Building on Linux
If you didn’t build Python from source, make sure you have Python’s development libraries installed.
In Debian or Ubuntu:

    $ sudo apt-get install python-dev python-setuptools

Or for Python 3:

    $ sudo apt-get install python3-dev python3-setuptools

需要50多M空间，算了还是`pip install pillow`就是了


下载pycharm的MySQL driver文件

Pause(Break),Prt Sc(SysRq)是一个键，没有fn功能
Del(Ins),NumLK(Scroll)有fn功能

进入gedit或者nautilus(文件管理器)后按f1或者工具栏的help中都可以查看得到其详细帮助，包括快捷键

haroopad打开一些窗口的时候（比如ctrl+s保存弹出窗口），窗口弹到顶层了，但其并没有获得焦点（可以看到关闭缩小状态栏是灰色的）


ctrl+alt+l 系统默认锁屏，但要用来格式化，所以设置为super+L
super+p 可将左面拉伸，出现滚动条，vmware不全屏时有点用（有时候会出问题）



命令行startapp
Python列表，字典中末尾和PHP一样可以加上逗号
pycharm terminal中ctrl+a可以ctrl+e recent files

命令和文件在tab时的区别

shell的快捷键版本和命令版本
纯shell操作比如搜索查找

tab对于目录又是生效的似乎

ctrl+d不像Windows删除（没反应），删除应该是delete

vmware启动Ubuntu时最好提前进入全屏，不然之后全屏好像会有问题

python执行顺序很重要，前面的不能访问后面的

改变文件的默认打开方式->打开文件属性的open with选项卡中设置就可以了

进入设置把系统的自动更新关了

搜狗输入法工作不正常的话，点击右上角键盘按钮可重启输入法

ctrl+d用于退出各种输入形式，python shell,mysql shell,输入用户名等
ctrl+c用于退出各种进程

要显示Zen of Python，在python shell/ide 的python console中输入`import this`