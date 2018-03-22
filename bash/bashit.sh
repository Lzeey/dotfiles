git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
#Runs the installation script. Requires a yes prompt
~/.bash_it/install.sh
#Replaces default bobby theme with powerline-plain
sed -i 's/BASH_IT_THEME=.*/BASH_IT_THEME="powerline-plain"/' ~/.bashrc
