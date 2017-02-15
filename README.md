### Installation


![screenshot](screenshot.png)

```bash
git clone git://github.com/baopham/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
```
* I use [vim-airline](https://github.com/bling/vim-airline), with Powerline symbols. Try this patched font if you want Powerline symbols: [Monaco for Powerline](https://gist.github.com/baopham/1838072/raw/2c0e00770826e651d1e355962e751325edb0f1ee/Monaco%20for%20Powerline.otf).  

> Shameless plug: I have a lot of settings and plugins and you might not like all of them. You can install [vundle-cli](https://github.com/baopham/vundle-cli) to quickly find/remove plugins and their settings
