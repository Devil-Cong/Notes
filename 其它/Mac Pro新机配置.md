### Mac Pro新机配置  

系统版本 10.12.1

#### Xcode command line tools  
> xcode-select --install

一开始当然是要安装基本的命令环境，比如make、git等等，因为本人不是一名iOS或者OS X开发人员，所以可以跳过安装XCode的过程，直接安装Xcode command line tools就可以了，直接执行上面的命令。  

如果想了解Xcode command line tools提供了多少可用的命令，可以到/Library/Developer/CommandLineTools/查看。

#### Homebrew
接着安装的肯定是[Homebrew](http://brew.sh/index_zh-cn.html)了，Homebrew的确是macOS不可或缺的套件管理器，有了它安装东西命令行程序都方便很多。

直接执行以下命令即可安装Homebrew 

> /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

安装完后我们需要做一件事让通过Homebrew安装的程序的启动连接(在/usr/local/bin中可以直接运行，无需将完整路径写出。通过以下命令将 /usr/local/bin 添加至 $PATH 环境变量中:
> echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile  

然后开启一个新的终端，运行以下命令确保brew正常运行
> brew doctor

需要查看如何使用Homebrew，执行
> brew help

#### Homebrew Cask
Homebrew是用来安装命令行程序的，而Homebrew cask是用来安装和管理图形界面程序，比如Google Chrome、Sublime Text等等。


#### ShadowsocksX
[ShadowsocksX](https://github.com/RobertYan/ShadowsocksX)程序员必备软件之一，有了它才能自由上Google、GitHub、YouTube等等，这个是macOS上的一个客户端，很简单，下载下来，配置一下，就可以用了，就不说太多了。

#### Proxychains-ng
当我们使用ShadowsocksX设置的全局翻的时候，对我们的终端是不起作用的，当我们使用命令行安装或者更新一些外国源的东西，速度就会非常慢，或者根本就操作不了，这个时候就必须利用[Proxychains-ng](https://github.com/rofl0r/proxychains-ng)跟shadowsocks搭配使用，实现真正的全局翻。

安装命令
> brew install proxychains-ng

编辑配置文件proxychains.conf
> vim /usr/local/etc/proxychains.conf
>   
> [ProxyList]  
> socks5 127.0.0.1 1080

禁用IPS
> 重启电脑->按住command+R->进入安全模式->左上角菜单"实用工具"->打开终端->输入"csrutil disable --without debug"->重启电脑
> 后面如果想重新开启IPS机制，重复上述步骤，执行命令改为"csrutil enable"即可。  

新开一个终端窗口，测试执行
> proxychains4 curl ip.cn  

如果返回的是代理IP，这表示终端代理成功。
> 此处遇到一个奇怪的问题，就是在macOS 10.12.1上面无论是brew安装，还是编译安装，都能提示安装成功，甚至`proxychains4 curl ip.cn`也能返回代理地址，但是就是在执行`proxychains4 brew update`时会有报错，查了很久也找不到原因，没办法解决。此处先留个坑，后面解决了再回来补充。  
> 为了能让终端也实现翻墙，我捣弄了一下，把家里的极路由装上shadowsocks，然后实现全网络翻墙，想想也是醉了。

#### nvm
作为一个前端开发人员，使用`nvm`来控制管理node版本这个是肯定的，当然有人也会选择`n`来控制管理。但是`n`与`nvm`的区别跟优劣在这之前已经有对比过了。详见[nvm与n.md](https://)。  
安装命令
> brew install nvm

创建nvm工作目录
> mkdir ~/.nvm

将以下内容写入shell的配置文件(~/.bashrc或者~/.profile或者~/.zshrc)
> export NVM_DIR=~/.nvm
> source $(brew --prefix nvm)/nvm.sh




#### 其它设置
> 设置Finder不要每次打开都是'所有文件'：Finder->偏好设置->通用->开启新Finder窗口时打开'Home'  
> 设置Finder搜索默认为当前文件夹而不是'整个Mac'：Finder->偏好设置->高级->执行搜索时选择'搜索当前文件夹'