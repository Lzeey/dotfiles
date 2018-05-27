# Automatic generation of apt-offline signature for installing dotfiles stuff

echo "==========Generating signature to dotfile-packages.sig==========="
echo -e  "\033[1;31m[WARNING] Perform a package update before running this\033[0m"
if [ -f aptoffline-packages.sh ]; then
    cd ..
fi
grep -rhE --regexp='^sudo (apt|apt-get).+install' | sed 's/-y //' | sort -u | sed -e 's/sudo apt install//' -e 's/sudo apt-get install//' | xargs sudo apt-offline set dotfile-packages.sig --install-packages
echo -e "\033[1;32mDone\033[0m"
