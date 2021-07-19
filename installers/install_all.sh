#!/bin/sh

export DEBIAN_FRONTEND=noninteractive 

echo ">>> installing basic stuff..."
echo ""
apt install -y --no-install-recommends curl zsh tmux 

echo ">>> installing dev stuff..."
echo ""
#add-apt-repository ppa:neovim-ppa/stable 
#apt-get update
apt install -y --no-install-recommends neovim nodejs npm grc

echo ""
echo ">>> installing vim-plug..."
echo ""
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo ""
echo ">>> installing git-split-diff..."
echo ""
# ref: https://github.com/banga/git-split-diffs
npm install -g git-split-diffs

echo ""
echo ">>> installing oh-my-zsh..."
echo ""
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ""
echo ">>> DONE! <<<"
