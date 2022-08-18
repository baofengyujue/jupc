~ /home/用户目录/ cd不跟参数也是进入到用户主目录
\- 返回上一路径
  shift+pageup/pagedown terminal/shell上下翻页
  --help/-? 查看命令帮助

sudo su 取得root身份
$ 表示普通用户
\# 表示root用户

clear/ctrl+l 清屏

\- 普通文件
  d 目录
  l 符号链接
  b 块文件

ls -alR a所有 l详细 R递归
rm -rf r(/R)递归 f强制
mv file1 file2 重命名
mv dir1 dir2 移动目录dir1及其下所有文件到dir2下
cp dir1 dir2 -r 拷贝目录
cp nginx.conf nginx.conf.bak2 将nginx.conf拷贝一份名为nginx.conf.bak2的文件在当前目录
mkdir dir
mkdir -p dir1/dir2/dir3
rmdir 如果文件夹不为空则不能移除
touch [OPTION]… FILE…
\* 将每个文件的访问及修改时间都更新为目前的时间。
\* 如果文件不存在，则创建一个字节数为0的文件。
cat 查看文件里内容，输出到终端
ln file linkname 硬链接
ln file linkname -s 软链接
tree (需要安装sudo apt-get install tree)
wc -c file c:chars l:lines w:words
du -hm dirpath 该目录及子目录的大小 -hm/k/b
df --block-size=GB 查看磁盘使用情况
df --block-size=MB
find . -name 'file*'
find / -name 'vimrc'
find ~ -name '*.c'

grep 'printf' /usr/include -Rn
R连同子目录所有文件一起查找
n显示匹配行及行号
l只显示匹配字符文件的文件名

dd if=file1 of=file2 将文件file1拷贝到file2(file2文件里的内容被替换为了file1文件里的内容)
dd if=/dev/zero of hello.txt bs=10M count=3 创建一个30M的空文件 bs:blocksize
/dev/zero 可用来初始化文件，从里面读出来的数据都是0

who -uH 查看当前在线用户情况
ps -aux 查看后台进程工作情况
jobs 查看当前shell正在运行哪些后台进程
ctrl+z 挂起当前进程
fg %2 将后台进程2移到前台
sudo gedit .bashrc & 后台打开文件
kill [-signal/进程编号] pid
kill -l 查看信号编号
kill命令如果不带参数而直接跟pid，就是发给该进程SIGTERM信号，大部分进程收到该
信号就会终止。但是被挂起的进程不能处理信号，所以必须发SIGKILL信号，由系统强制终
止进程。
env 查看环境变量
sudo useradd -s /bin/bash -g jwGroup -G root,adm -d /home/jw -m jackwang 创建用户jackwang
-s 指定新用户登陆时shell类型
-g 指定所属组，该组必须已经存在
-G 指定附属组，该组必须已经存在
-d 用户家目录
-m 用户家目录不存在时，自动创建该目录
sudo passwd jackwang 改变用户jackwang的密码
su 切换用户
sudo su 切换为root用户
sudo userdel -r jackwang 删除用户 r将用户的主目录一并删除
man 3 printf 打开第3章的printf文档
alias ls='ls --color=auto'
alias rm='rm -i'
echo $? 程序的结束返回值 正常结束为0
666(/创建时指定的权限) & ~umask 就为文件默认创建时的权限
uname -a 查看内核版本信息
shutdown -h now 立刻关机
shutdown -r now 立刻重启
which ls
whoami
pwd
chmod
000 0
001 1
010 2
011 3
100 4
101 5
110 6
111 7

sudo chown user:group file
sudo chown user:group dir -R

sudo fdisk -l

sudo mount dev/sdb1 /mnt
sudo umount /mnt

tar/rar/zip
tar:
打归档包:
tar cvf dir.tar dir
解tar xvf dir.tar
打gz压缩包:
tar zcvf dir.tar.gz dir
解tar zxvf dir.tar.gz


source 脚本文件路径
就是执行另一个脚本文件，并立即生效，不用关闭重新打开terminal


在bash shell中
句点'.'和source的作用相同
可以通过比较'. --help'和'source --help'得到此结论

f2--rename(不能像windows一样延迟点击重命名)