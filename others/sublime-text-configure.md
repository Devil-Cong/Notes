### Sublime Text 3 配置记录

#### Package Control
 [Package Control](https://packagecontrol.io) 果断且必须是Sublime Text必被的一个插件，有了它你就可以方便的管理安装其它的插件。

按住`Ctrl+\``，在出来的输入框里面输入以下代码(以下代码只适用于Sublime Text 3)

```python
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

```