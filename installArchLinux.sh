 #! /bin/bash

sudo pacman -S zsh

chsh -s $(which zsh)

sudo pacman -S tmux

sudo pacman -S powerline

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sS https://starship.rs/install.sh | sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo pacman -S zsh-syntax-highlighting

sudo pacman -S xclip

sudo pacman -S stow

stow zsh bash tmux vim git 

ln -s -f .tmux/.tmux.conf

sudo pacman -S exa

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

curl -fsSL https://get.pnpm.io/install.sh | sh -
