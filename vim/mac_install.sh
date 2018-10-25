brew install vim

#Install vundle - vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install colorschemes
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/colorschemes
mv ~/.vim/colorschemes/* ~/.vim/
rm -rf ~/.vim/colorschemes/
rm ~/.vim/README.md

#To install color schemes and apply standardized config
ln -s $(pwd)/.vimrc ~/.vimrc
#ln -s .vim ~/.vim

