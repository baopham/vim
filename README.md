### Installation

This is a minimal version without fancy statusline, less customized and only "essential" plugins are installed.

```bash
git clone -b minimal git://github.com/baopham/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
```
