
# 常用配置

## 交流

- [微信](https://weixin.qq.com/cgi-bin/readtemplate?t=mac&lang=zh_CN)
- [QQ](https://im.qq.com/download/)
- [钉钉](https://tms.dingtalk.com/markets/dingtalk/download)

## 开发

- [iTerm终端](https://iterm2.com/downloads/stable/latest)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/download)
- [Sublime Text](https://www.sublimetext.com/)

```python
# 安装包管理工具
import urllib.request,os;
pf = 'Package Control.sublime-package';
ipp = sublime.installed_packages_path();
urllib.request.install_opener( 
urllib.request.build_opener( urllib.request.ProxyHandler()) ); 
open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 
'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
```

- [Chrome浏览器](https://www.google.cn/chrome/index.html)
- [Postman模拟请求](https://www.getpostman.com/apps)
- [Sourcetree可视化git工具](https://www.sourcetreeapp.com/)
- [nodjs版本管理nvm](https://github.com/creationix/nvm)

```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
```

- [Homebrew MAC电脑包管理工具](https://brew.sh/)
```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- [n强大的nodejs版本管理工具](https://github.com/tj/n)
```shell
curl -L https://git.io/n-install | bash
```

- [nginx强大的HTTP服务器](https://github.com/tj/n)
```shell
brew install nginx
```

- [zsh强大的shell脚本](https://github.com/robbyrussell/oh-my-zsh)
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

- vi强大的linux文本编辑器 [.vimrc](./.vimrc)
```shell
# 常见插件列表
# Vundle.vim 为vim插件管理工具
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 文档树查看插件
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# git 状态变更插件
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin

# vim 的pug插件
git clone https://github.com/posva/vim-vue.git ~/.vim/pack/plugins/start/vim-vue
```

- live-server快速启动制定目录作为本地静态服务器
```shell
npm i live-server -g
```

- [.gitconfig](./.gitconfig) 当前用户根目录全局git配置


## 娱乐

- [爱奇艺](http://www.iqiyi.com)
- [网易云音乐](https://music.163.com/#/download)
- [迅雷](http://www.xunlei.com/)
- [IINA视频播放器]([https://iina.io/](https://iina.io/))



