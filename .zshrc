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
alias cls='clear'
alias ba='cd ..;'
alias l.='lsd -al'
alias bthscn='bluetooth on;sleep 1;bluetoothctl power on;bluetoothctl connect 40:72:18:B6:5B:85'
alias tggboost="cat /sys/devices/system/cpu/cpufreq/boost| awk '{printf !\$a}'| sudo tee /sys/devices/system/cpu/cpufreq/boost"
alias batgg="awk '{printf !\$a;}' /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode> /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"


alias storage='df | grep -P "^File|/home|/$"'
alias booff= 'sudo echo "0" | sudo tee /sys/devices/system/cpu/cpufreq/boost'
alias car='cd /home/asem/sec/Career/;rg'
alias rg='ranger'

alias download='sudo pacman -S'
alias usys='sudo pacman -Syu'
alias remove='sudo pacman -R'


# directory nvim: open nvim in the directory of the file given as argument
# usage: dnvim some/directory/file.txt
# will open the "file.txt" in some/directory/file.txt in nvim
# and the working directory of nvim will be the directory that contains the 
# opened file. In this case "some/directory"
# This is awesome because I can then see files in the directory with telescope 
# and nvim-tree and the directory of toggleterm will be set to be the directory 
# of the current file
alias dnvim='nvim -c "cd %:p:h"'

alias gits='git status'
alias gitd='git diff'
alias gitsn='git status -uno'
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
export MANPAGER='nvim +Man!'
PATH=$PATH:/home/asem/Downloads/lua-language-server/bin
# PATH=$PATH:/usr/local/texlive/2024/bin/x86_64-linux
export TEXMFHOME=~/texmf
export PATH=/usr/local/texlive/2024/bin/$(uname -m)-$(uname -s | tr 'A-Z' 'a-z'):$PATH
export PATH
export QT_QPA_PLATFORMTHEME=qt5ct
