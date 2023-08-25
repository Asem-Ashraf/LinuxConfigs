# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias list='lsd -a'
alias storage='df | grep -P "^File|/home|/$"'
alias booff= 'echo "0" | sudo tee /sys/devices/system/cpu/cpufreq/boost'
alias car='cd /home/asem/Sec/Career/;rg'
alias cls='clear'
alias rg='ranger'
alias download='sudo pacman -S'
alias update='sudo pacman -Syu'
alias uninstall='sudo pacman -R'
alias messenger='nohup ~/messenger-linux-x64/Messenger;'

alias gits='git status'
alias gita='git add'
alias gitp='git push'
alias gitc='git commit -m'
alias gitl='git log --oneline --graph --decorate'
alias gitll='git log --oneline --graph --decorate --all'

#auto completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files
#vim mode
bindkey -v
export KEYTIMEOUT=1.
export EDITOR='nvim -p'
export VISUAL='nvim -p'
PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
export PATH
INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH
export INFOPATH
MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH
export MANPATH
