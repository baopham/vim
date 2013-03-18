### Installation

```bash
git clone git://github.com/baopham/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```
I use [Powerline](https://github.com/Lokaltog/powerline), so if you want, install it, then install the patched font [Monaco for Powerline](https://gist.github.com/baopham/1838072#file-monaco-powerline-otf).  
If not, you should remove all the Powerline's settings in the `vimrc` file

