# Installing full version of Vim for Ubuntu
Source: https://docs.oseems.com/general/operatingsystem/ubuntu/install-vim

Ubuntu ships with the minimal version of Vim which lack features such as syntax highlighting making it less powerful or useful as it could be.

What the .sh runs
sudo apt update
sudo apt -y remove vim-tiny
sudo apt -y install vim

[Optional]
Perform customization of vim in .vimrc
