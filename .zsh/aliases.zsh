
# Colorize output, add file type indicator, and put sizes in human readable format
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi
alias ls="ls -Fph ${colorflag}"
alias dl="sudo apt-fast install"
alias update="sudo apt-fast update && sudo apt-fast upgrade"
alias sudo='sudo ' # Makes sudo use aliases, from https://askubuntu.com/a/22043/353466
alias please='sudo $(fc -nl -1)' # Repeat last command with sudo