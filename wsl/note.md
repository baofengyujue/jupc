解决默认不能上网：
第一步：
修改/etc/resolv.conf，如果不能修改（默认为软链接）
需`sudo rm -f /etc/resolv.conf`先删除再创建文件
sudo vim /etc/resolv.conf
在文件中输入：
```
nameserver 8.8.8.8
nameserver 223.5.5.5
```

第二步：
这一步是为了防止每次重启wsl，/etc/resolv.conf文件都被重置
`sudo vim /etc/wsl.conf`
然后输入：
```
[network]
generateResolvConf = false
```


在命令行中输入
wsl或者ubuntu都能进入到wsl系统中
输入wt为进入到windows terminal中

解决在wsl中 Why is VIM starting in REPLACE mode?
参：https://github.com/vim/vim/issues/6365
在vimrc文件中加入一句`set t_u7=`就可以了

wsl第一次启动时出现错误`/etc/update-motd.d/50-landscape-sysinfo: 17: cannot create /var/lib/landscape/landscape-sysinfo.cache: Permission denied`
解决：
```bash
sudo apt remove landscape-common
sudo apt autoremove # Optionally, but recommended
rm ~/.motd_shown
```
参：https://askubuntu.com/questions/1414483/landscape-sysinfo-cache-permission-denied-when-i-start-ubuntu-22-04-in-wsl


```cmd
wsl --shutdown
```

查看wsl版本
wsl --list --verbose
or
wsl -l -v

wsl --set-version ubuntu 2

wsl --status

explorer.exe .


wsl1下gdb调试出现错误`warning: opening /proc/PID/mem file for lwp 615.615 failed: No such`
解决办法：
```bash
echo -ne '\x90\x90' | sudo dd of=/usr/bin/gdb seek=$((0x335bad)) bs=1 count=2 conv=notrunc
```
这行命令就是修改了/usr/bin/gdb文件
如果想欢迎这个执行文件，执行：
sudo apt reinstall gdb

参：https://github.com/microsoft/WSL/issues/8516