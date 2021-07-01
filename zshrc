export PATH=$PATH:/usr/local/bin:$HOME/go/bin
export GOPATH=$HOME/go
export DOTFILES=$HOME/workspace/dotfiles
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# === theme ===
#ZSH_THEME="avit"
ZSH_THEME="agnoster"
#ZSH_THEME="spaceship"


plugins=(git zsh-syntax-highlighting zsh-autosuggestions z fzf docker)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

# see https://github.com/deliveryhero/kube-env
if [[ -f ~/dh/bin/kube-env ]]; then
	eval "$(~/dh/bin/kube-env)"
fi
