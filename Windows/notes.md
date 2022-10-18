## 创建编辑环境变量的快捷方式
右键-->new-->shortcut-->"Type the location of the item:"中输入cmd，点击"next"；这一步是指定打开的程序或者网络位置
  -->"Type a name for this shortcut:"输入快捷键的名字-->点击"Finish"
右键创建出来的快捷方式，在"Target"中输入`rundll32 sysdm.cpl,EditEnvironmentVariables`，确定即可
参：https://www.shellhacks.com/windows-environment-variables-editor-quick-shortcut/


## 开机失去网络解决：
system-->power&sleep-->additional power settings-->choose what the power buttons do-->change settings that are currently unavailable-->uncheck "turn on fast startup"