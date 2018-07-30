#!/usr/bin/env bash
cd "$(dirname "$(realpath "$0")")";
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' &&

sudo apt-get update &&
sudo apt-get install -y code &&

# Installs python extensions
code --install-extension ms-python.anaconda-extension-pack
code --install-extension pkief.material-icon-theme
code --install-extension ms-python.python
code --install-extension redhat.vscode-yaml
code --install-extension robertohuertasm.vscode-icons

echo "Installed extensions"
echo "$(code --list-extensions)"

#Copies config to vscode folder
ln -s "$(pwd)/settings.json" ~/.config/Code/User/settings.json

# Installs Hack Nerd Font (for user)
mkdir -p ~/.config/share/fonts
cd ~/.local/share/fonts
curl -fL --output "~/.config/share/fonts/Hack Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

echo "Installation Done"
