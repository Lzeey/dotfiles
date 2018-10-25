# Install
brew install tmux

# Clone theme
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

#[Optional] Add mouse option to file
echo "set -g mouse on" >> ~/.tmux.conf.local
