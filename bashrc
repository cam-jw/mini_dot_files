# If not running interactively, don't do anything
[[ $- != *i* ]] && return

XDG_CONFIG_HOME="$HOME/.config"
DOTFILES_DIR="~/dotfiles" # Assuming the current directory contains dotfiles

# Set to superior editing mode
set -o vi

alias v=nvim
alias h=hx

# clear
alias c='cl'

# cd
alias docs='cd ~/Documents/'
alias todo='nvim ~/Documents/todos/base.md'
alias ..="cd .."
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias dots='cd ~/dotfiles'
alias cl="clear"

# storage
alias du='du -kh'  # file space
alias df='df -kTh' # disk space

# clipboard
alias y="pbcopy"

# ls
alias ls='ls -F --color=auto'
alias lla='ls -pAl'
alias lls='ls -plSr'
alias tree='tree -FCsu'

# files
alias rmd='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# tmux
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias tkill='tmux kill-server'
alias e='exit'

# git
alias ga='git add'
alias gaa='git add .'
alias gcl='git clone'
alias gb='git branch'
alias gco='git checkout'
alias gcom='git checkout master'
alias gp='git push'
alias gpp='git pull'
alias gf='git fetch'
alias gs='git status'
alias gc='git commit -m'
alias grbm='git rebase master'
alias grbc='git rebase continue'
alias grba='git rebase abort'
alias grhead='git reset HEAD^'
alias grhard='git fetch origina && git reset --hard'
alias gst='git stash'
alias gstp='git statsh pop'
alias gstc='git stash clear'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias lg='lazygit'

# ricing
alias et='v ~/.config/awesome/themes/powerarrow/theme-personal.lua'
alias ett='v ~/.config/awesome/themes/powerarrow-dark/theme-personal.lua'
alias er='v ~/.config/awesome/rc.lua'
alias ez='v ~/.zshrc'
alias eb='v ~/.bashrc'
alias et='v ~/.tmux.conf'
alias ev='cd ~/.config/nvim/ && v init.lua'
alias eh='h ~/.config/helix/config.toml'
alias sz='source ~/.zshrc'
alias sb='source ~/.bashrc'
alias st='tmux source ~/.tmux.conf'
alias s='source'
alias home='cd ~'

# fuzzy file searching with fzf -> nvim
alias fp="fzf --preview 'bat --style=plain --color=always --line-range :500 {}'"
alias vf='v $(fp)'

# pdf reading
alias pdf='zathura'
alias fpdf="find . -type f -iname '*.pdf' | fzf --preview 'pdftotext {} - | head -n 100'"
alias pdfp='zathura $(fpdf)'

# env variables
export VISUAL=nvim
export EDITOR=nvim
. "$HOME/.cargo/env"

# themes
alias ud='ln -sf ~/dotfiles/alacritty_dark.toml $XDG_CONFIG_HOME/alacritty/alacritty.toml'
alias ul='ln -sf ~/dotfiles/alacritty_light.toml $XDG_CONFIG_HOME/alacritty/alacritty.toml'

# python env
alias mp='source .venv/bin/activate && export PYTHONPATH="~/code/qur8ml:$PYTHONPATH"'
alias a1='cd ~/code/a1'

export PATH="$PATH:/Users/cam/.local/share/bob/nvim-bin"

