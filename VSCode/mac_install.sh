#!/usr/bin/env bash

brew cask install visual-studio-code

#Font installation
brew cask install font-hack-nerd-font-mono font-hack-nerd-font font-meslo-for-powerline font-meslo-nerd-font font-meslo-nerd-font-mono

# Might need to include path first, for extension downloads to work
# Installs python extensions
code --install-extension ms-python.anaconda-extension-pack
code --install-extension pkief.material-icon-theme
code --install-extension ms-python.python
code --install-extension redhat.vscode-yaml
code --install-extension robertohuertasm.vscode-icons
code --install-extensions donjayamanne.jupyter
echo "Installed extensions"
echo "$(code --list-extensions)"

#Copies config to vscode folder
ln -s "$(pwd)/settings.json" ~/Library/Application\ Support/Code/User/settings.json

echo "Installation Done"
