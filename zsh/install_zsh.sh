# Installation of zsh

sudo apt install git zsh fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# modify .zshrc
sed -i 's/ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
