### Mac Pro新机配置  

系统版本 10.12.1

#### Xcode command line tools  
```shell
xcode-select --install
```
一开始当然是要安装基本的命令环境，比如make、git等等，因为本人不是一名iOS或者OS X开发人员，所以可以跳过安装XCode的过程，直接安装Xcode command line tools就可以了，直接执行上面的命令。  

如果想了解Xcode command line tools提供了多少可用的命令，可以到/Library/Developer/CommandLineTools/查看。

#### Homebrew
接着安装的肯定是[Homebrew](http://brew.sh/index_zh-cn.html)了，Homebrew的确是macOS不可或缺的套件管理器，有了它安装东西命令行程序都方便很多。

直接执行以下命令即可安装Homebrew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
```

安装完后我们需要做一件事让通过Homebrew安装的程序的启动连接(在/usr/local/bin)中可以直接运行，无需将完整路径写出。通过以下命令将 `/usr/local/bin` 添加至 $PATH 环境变量中:

```
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile  
```
然后开启一个新的终端，运行以下命令确保brew正常运行

```
brew doctor
```
需要查看如何使用Homebrew，执行

```
brew help
```
Homebrew的源在国内访问不太的顺畅，因此我们可以更换一下源，推荐中科大的
> [替换Homebrew默认源](https://lug.ustc.edu.cn/wiki/mirrors/help/brew.git)  
> [替换Homebrew Bottles默认源](https://lug.ustc.edu.cn/wiki/mirrors/help/homebrew-bottles)

#### Homebrew Cask
Homebrew是用来安装命令行程序的，而[Homebrew Cask](https://caskroom.github.io)是用来安装和管理图形界面程序，比如Google Chrome、Sublime Text等等。
执行以下命令即可

```
brew tap caskroom/cask
```
需要查看Homebrew Cask是否支持某个软件，可以到[caskroom.github.io](https://caskroom.github.io/search)查看

#### ShadowsocksX
[ShadowsocksX](https://github.com/RobertYan/ShadowsocksX)程序员必备软件之一，有了它才能自由上Google、GitHub、YouTube等等，这个是macOS上的一个客户端，很简单，下载下来，配置一下，就可以用了，就不说太多了。

#### Proxychains-ng
当我们使用ShadowsocksX设置的全局翻的时候，对我们的终端是不起作用的，当我们使用命令行安装或者更新一些外国源的东西，速度就会非常慢，或者根本就操作不了，这个时候就必须利用[Proxychains-ng](https://github.com/rofl0r/proxychains-ng)跟shadowsocks搭配使用，实现真正的全局翻。

安装命令

```
brew install proxychains-ng
```

编辑配置文件proxychains.conf

```
vim /usr/local/etc/proxychains.conf 

[ProxyList]  
socks5 127.0.0.1 1080
```

禁用IPS

重启电脑->按住command+R->进入安全模式->左上角菜单"实用工具"->打开终端->输入"csrutil disable --without debug"->重启电脑

后面如果想重新开启IPS机制，重复上述步骤，执行命令改为"csrutil enable"即可。  

新开一个终端窗口，测试执行

```
proxychains4 curl ip.cn  
```

如果返回的是代理IP，这表示终端代理成功。  
此处遇到一个奇怪的问题，就是在macOS 10.12.1上面无论是brew安装，还是编译安装，都能提示安装成功，甚至`proxychains4 curl ip.cn`也能返回代理地址，但是就是在执行`proxychains4 brew update`时会有报错，查了很久也找不到原因，没办法解决。此处先留个坑，后面解决了再回来补充。  
为了能让终端也实现翻墙，我捣弄了一下，把家里的极路由装上shadowsocks，然后实现全网络翻墙，想想也是醉了。

#### 终端
苹果的终端相当不好用，所以需要重新弄一个好用的终端，iterm2+zsh+oh_my_zsh这个应该是所有macOS使用终端的标配了。首先想到[iterm](https://www.iterm2.com/downloads.html)官网下载iterm2，并把它拖进Application里面。

苹果系统已经安装好zsh了，所以无需重新安装，只要设置一下可以了。  
查看zsh路径
```
whereis zsh
```

将的zsh路径添加进`/etc/shells`最后面，把我们默认使用的Shell设置为zsh。  
新启一个终端，仔细以下命令，看看是否设置成功

```
echo $SHELL
```

然后就是安装[oh-my-zsh](http://ohmyz.sh/)，执行

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

修改配置文件，这里我们创建多一个`env.sh`文件，用于维护别名(aliases)，输出(exports)和路径改变(path changes)等等，以免影响`~/.zshrc`

修改`~/.zshrc`文件，设置[主题](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes)，插件，引入`env.sh`

```
ZSH_THEME="pygmalion"  
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

# Add env.sh  
source ~/env.sh   
```
创建编辑~/env.sh文件，内容如下

```
#!/bin/zsh

# PATH  
export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"  
export EDITOR='vim -w'  
# export PYTHONPATH=$PYTHONPATH  
# export MANPATH="/usr/local/man:$MANPATH"  

# FileSearch  
function f() { find . -iname "*$1*" ${@:2} }  
function r() { grep "$1" ${@:2} -R . }  

# mkdir and cd  
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases  
alias cppcompile='c++ -std=c++11 -stdlib=libc++'  
alias zshconfig="vim ~/.zshrc"  
alias envconfig="vim ~/Projects/config/env.sh"  
alias grep="grep --color=auto"  
```

#### nvm
作为一个前端开发人员，使用[nvm](https://github.com/creationix/nvm)来控制管理node版本这个是肯定的，当然有人也会选择n来控制管理。但是n与nvm的区别跟优劣在这之前已经有对比过了。详见[nvm与n.md](https://github.com/Devil-Cong/Notes/blob/master/%E7%BC%96%E7%A8%8B/nvm%E4%B8%8En.md)。  
安装命令

```
brew install nvm
```
创建nvm工作目录

```
mkdir ~/.nvm
```
将以下内容写入shell的配置文件(`~/.bashrc`或者`~/.profile`或者`~/.zshrc`)

```
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
```

[详细使用方法](https://github.com/creationix/nvm#usage)

#### 其它设置
> 设置Finder不要每次打开都是'所有文件'：Finder->偏好设置->通用->开启新Finder窗口时打开'Home'  
> 设置Finder搜索默认为当前文件夹而不是'整个Mac'：Finder->偏好设置->高级->执行搜索时选择'搜索当前文件夹'





