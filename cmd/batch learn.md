1. Windows Server 2003 and later (i.e. anything after Windows XP 32 bit) provide the `where.exe`program which does some of what `which` does, though it matches all types of files, not just executable commands. (It does not match built-in shell commands like `cd`.) It will even accept wildcards, so `where nt*` finds all files in your `%PATH%` and current directory whose names start with `nt`.

   Try `where /?` for help.

   Note that Windows PowerShell defines `where` as an alias for [the `Where-Object` cmdlet](http://technet.microsoft.com/en-us/library/hh849715.aspx), so if you want `where.exe`, you need to type the full name instead of omitting the `.exe` extension

2. cmd图标右键属性修改字体,或者界面左上角点击出来的菜单点击default出来的设置中修改过后不生效;只有在左上角出来的菜单中的properties中修改才生效,但是其中又没有consolas字体,网上各种查,都不行,所以还是不要去折腾了,就用默认的;powershell和cmd共用一套设置的,所以修改了cmd的字体也就修改了powershell的了