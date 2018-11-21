# Bash customization
# 1. Installs bashit (with custom theme)
# 2. Installs powerline fonts
# 3. Customize less (for colored man pages)

# Get functions for installation
. alias.bash &&

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
# Runs the installation script. Requires a yes prompt
~/.bash_it/install.sh

# Soft-link the custom theme onto the theme folder
ln -s "$(pwd)/powerline-plain-custom" ~/.bash_it/themes/powerline-plain-custom

# Replaces default bobby theme with powerline-plain
sedi 's/BASH_IT_THEME=.*/BASH_IT_THEME="powerline-plain-custom"/' ~/.bash_profile

# Installs powerline font
brew tap homebrew/font-casks
brew cask install font-menlo-for-powerline font-source-code-pro-for-powerline

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

#Installs custom alias
echo "" >> ~/.bashrc
echo "# Custom alias for bashrc" >> ~/.bashrc 
echo ". " "$(pwd)/alias.bash" >> ~/.bashrc
