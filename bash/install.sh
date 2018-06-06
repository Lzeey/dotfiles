# Bash customization
# 1. Installs bashit (with custom theme)
# 2. Customize less (for colored man pages)

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
# Runs the installation script. Requires a yes prompt
~/.bash_it/install.sh
# Replaces default bobby theme with powerline-plain
sed -i 's/BASH_IT_THEME=.*/BASH_IT_THEME="powerline-plain"/' ~/.bashrc

# Appends colouring for less (for man pages)
cat >> ~/.bashrc << EOL
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
EOL

echo -e "\033[1;32mDone\033[0m"
