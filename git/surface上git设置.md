git基础设置
git config --global user.name "jack518"
git config --global user.email "baofengyujue@live.com"

在surface上要使本地repo能够push到GitHub上需要如下设置

1. 已经得到验证的方法
   - 安装git时，勾选use the native Windows Secure Channel Library，
     和勾选git credential manager
   - 随后在git push的时候会提示输入密码等，输入即可
   - 然后在用户目录下找到.gitconfig文件，在尾部添加
     ```
        [credential]
        helper = store
        modalPrompt = true
     ```
     这样就无需每次输入密码了
   - 输入密码后保存后，用户目录下会多出一个保存密码的.git-credentials文件
   - 重装git，不需要先卸载，再运行git安装包就行了
      一切默认下一步就行了，也就是覆盖use the native Windows Secure Channel Library和
      git credential manager的设置
   - 这样就既能使用git默认设置，又能正常git push了


2. 未验证的方法
   - 安装git的时候以管理员身份安装就行了(未验证)



# .gitconfig文件内容
```
[user]
	name = go2
	email = baofengyujue@live.com
[filter "lfs"]
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
	clean = git-lfs clean -- %f
[init]
	defaultBranch = master
[credential]
	helper = store
	modalPrompt = true
```

# .git-credentials文件内容
```
https://baofengyujue:Zhang%21%40138962@github.com
```