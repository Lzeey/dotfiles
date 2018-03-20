sudo apt update
sudo apt -y remove vim-tiny
sudo apt -y install vim

#Install vundle - vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Get NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

#To install color schemes and apply standardized config
cp .vimrc ~/.vimrc
cp -r .vim ~/.vim


