KEYTIMEOUT=1

# oh-my-zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# p10k
source ~/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# color schemes
# source $HOME/dotfiles/.syntax_highlighting

# aliases
source $HOME/dotfiles/.bashrc
source $HOME/dotfiles/qureight_aliases
tmux source ~/.tmux.conf

# ssh-add ~/.ssh/dev_server.pem

