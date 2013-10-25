### Installation

```bash
git clone git://github.com/baopham/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```
I use [Powerline](https://github.com/Lokaltog/powerline), so if you want, install it through Vundle (already included in file `vimrc`), then install the patched font [Monaco for Powerline](https://gist.github.com/baopham/1838072/raw/2c0e00770826e651d1e355962e751325edb0f1ee/Monaco%20for%20Powerline.otf).  
If not, you should remove all the Powerline's settings in the `vimrc` file

