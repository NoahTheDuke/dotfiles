# Created by Zap installer
[ -f "$XDG_DATA_HOME/zap/zap.zsh" ] && source "$XDG_DATA_HOME/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

mkdir -p "$XDG_STATE_HOME"/zsh/
mkdir -p "$XDG_CACHE_HOME"/zsh/
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
mkdir -p "$XDG_CONFIG_HOME"/zsh/.zsh-complete

fpath=("$XDG_CONFIG_HOME"/zsh/.zsh-complete $fpath)

source "$XDG_CONFIG_HOME"/jj/jj-prompt.sh

NEWLINE=$'\n'
PS1='$(print "%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%}${NEWLINE}$(jjgit_prompt)")'
RPROMPT='%F{red}%(?..%?)%f'

for FILE in "$XDG_CONFIG_HOME"/zsh/conf.d/*; do
    source $FILE
done

setopt share_history
autoload -Uz compinit && compinit
autoload -U colors && colors
setopt prompt_subst
