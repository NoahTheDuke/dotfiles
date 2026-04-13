# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

setopt share_history
autoload -Uz compinit && compinit
autoload -U colors && colors
setopt prompt_subst

source ~/dotfiles/jj/jj-prompt.sh

NEWLINE=$'\n'
PS1='$(print "%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%}${NEWLINE}$(jjgit_prompt)")'

mkdir -p "$XDG_STATE_HOME"/zsh/
mkdir -p "$XDG_CACHE_HOME"/zsh/
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history

for FILE in ~/dotfiles/zsh/conf.d/*; do
    source $FILE
done
