 #! /bin/bash

sudo apt install zsh

chsh -s $(which zsh)

sudo apt install tmux

sudo apt install powerline

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sS https://starship.rs/install.sh | sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo apt install zsh-syntax-highlighting

sudo apt install xclip

sudo apt install stow

stow zsh bash tmux vim git 

ln -s -f .tmux/.tmux.conf

sudo apt install exa

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

curl -fsSL https://get.pnpm.io/install.sh | sh -
