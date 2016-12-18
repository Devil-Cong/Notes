### 极路由+shadowsocks

#### 写在前面
最近在帮女票捣弄着电脑开发环境的配置，在终端翻墙那一步出了点问题。电脑那边直接弄了个ShadowsocksX实现了"全局"翻墙。这个"全局"是指终端除外。不过对于程序开发人员来说，有很多环境或者命令行程序都是要通过终端来操作的。所以终端不能翻墙也相当只能用左手，右手却用不了。原本是有个叫proxychains-ng的东西可以实现终端翻墙的，但是奇怪的是proxychains-ng在我的电脑(macOS 10.11.5)上面是没问题的。但是我在我女朋友的新的电脑系统(macOS 10.12.1)上面可以安装，但是使用的时候却会报错，无论是自己编译安装还是通过brew来安装。查了很多资料，折腾很久都搞不掂。真是让人有点无奈。但是女朋友电脑的开发环境还是要搭建的，所以就想到把家里的极路由弄上shadowsocks，这样子就可以实现真正的全局翻墙了。

#### 参考
> 罗磊同志的博客[极路由Shadowsocks家庭无痛翻墙实践](https://luolei.org/hiwifi-shadowsocks/)

#### 1、开启开发者模式
发现家里的极路由还没开始开发者模式，也还没root。这步很简单。
> 登录极路由后台->点击云插件->点击路由信息->点击高级设置->开通开发者模式

开通开发者模式会失去保修，并且不可恢复。这个对我来说没什么关系，反正保修期已经过去了。开通过程要我绑定了手机，绑定微信。

#### 2、SSH登录极路由
> ssh root@192.168.199.1 -p 1022 #使用root帐号连接路由，端口为1022，密码为后台登陆密码。

#### 3、安装便捷脚本
> cd /tmp && wget http://cdn.is26.com/file/hiwifi/shadow.sh && sh shadow.sh && rm shadow.sh

#### 4、开启极路由shadowsocks
> 重新登录极路由后台->高级选项->shadowsocks加速

在表单中填写SS帐号密码和加密方式，选择智能模式，保存，只要提示"运行中"已加速就表示已经成功连上shadowsocks了。
> 1、特别注意:请关闭极路由的自动更新功能，要不每次路由器升级后，会删除SS插件。  
> 2、若shadowsocks选项显示的是：{ "msg": "请求的接口不存在.", "code": 560 }，请重启路由器。

#### 5、更新路由表
罗磊同志已经放出一键更新路由表的脚本了，直接执行就可以更新域名策略，哪些域名需要翻墙。
> cd /etc/gw-redsocks/gw-shadowsocks && wget http://this.is26.com/download/gfw.txt && cat gfw.txt >> gw-shadowsocks.dnslist && /etc/init.d/dnsmasq restart

#### 最后
再次致谢罗磊同志放出来的教程及脚本[极路由Shadowsocks家庭无痛翻墙实践](https://luolei.org/hiwifi-shadowsocks/)