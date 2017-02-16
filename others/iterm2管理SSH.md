### iterm2管理SSH

使用终端远程连接服务器的时候，都需要手动输入密码，而有时候服务器一多，或者密码比较复杂的时候就比较麻烦，需要找个文档把每台服务器的地址跟对应的密码保存起来，然后要连接的时候再去查看，今天看了一篇文章，发现可以用`iterm2`来管理`SSH`。这些记录一下。

#### 1、编写连接脚本
```shell
# vps.23 是文件名字，可以随便取
vim ~/.ssh/vps.23 
```

```shell
#!/usr/bin/expect -f  
set user <用户名>  
set host <ip地址>  
set password <密码>  
set timeout -1  

spawn ssh $user@$host  
expect "*assword:*"  
send "$password\r"  
interact  
expect eof  
```

#### 2、先手动连接一次远程，否者会卡在yes那里

#### 3、配置iterm2
打开`iterm2`，选择`Preferences`，再选择`Profiles`，按`+`号新增一个`profile`，填写好名称方便以后区分，然后在右边的`Command`输入框中写上

```shell
# expect <刚刚保存脚本的路径>
expect ~/.ssh/vps.23 
```
#### 原文来自
> 半兽人的[ITerm2下使用ssh保存密码](http://orchome.com/99)

