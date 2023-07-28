alias pyenv="~/.pyenv/bin/pyenv"
alias nzbget="~/nzbget/nzbget"
alias wtf="wtfutil"
alias ls="lsd"
alias e="$EDITOR"
alias cp='cp -r --reflink=auto'
alias du='dua'
alias dui='dua interactive'
alias mkdir='mkdir -p'
alias hex='teehee'
alias hexdump='od -A x -t x1z -v'
alias http-serve='python -m http.server'
alias htpasswd='openssl passwd -apr1'
alias ip='ip -color -brief'
alias o='cglaunch xdg-open'
alias rm!='\rm -rf'
alias rsync='rsync --verbose --archive --info=progress2 --human-readable --partial'
alias sudo='sudo -E '
alias tree='tree -a -I .git --dirsfirst'
alias ll='ls -l'
alias utc='env TZ=UTC date'
alias battery-normal='sudo cctk --PrimaryBattChargeCfg=custom:50-86 --ValSetupPwd="$(pass personal/bios)"'
alias battery-full='sudo cctk --PrimaryBattChargeCfg=standard --ValSetupPwd="$(pass personal/bios)"'
alias gpg-change-card='gpg-connect-agent "scd serialno" "learn --force" /bye'
alias yd='yt-dlp --external-downloader aria2c --sponsorblock-mark all'

alias dl="sudo apt-fast install -y"
alias update="sudo apt-fast update && sudo apt-fast upgrade && sudo apt-fast dist-upgrade -y"
alias remove="sudo apt-fast remove -y"
alias ppa="sudo add-apt-repository"
alias sudo='sudo ' # Makes sudo use aliases, from https://askubuntu.com/a/22043/353466
alias please='sudo $(fc -nl -1)' # Repeat last command with sudo


alias docker='sudo docker'

## systemctl

alias sys='systemctl'
alias sysu='systemctl --user'
alias status='sys status'
alias statusu='sysu status'
alias start='sys start'
alias startu='sysu start'
alias stop='sys stop'
alias stopu='sysu stop'
alias restart='sys restart'
alias restartu='sysu restart'
alias enable='sys enable'
alias enableu='sysu enable'
alias disable='sys disable'
alias disableu='sysu disable'
alias reload='sys daemon-reload'
alias reloadu='sysu daemon-reload'
alias timers='sys list-timers'
alias timersu='sysu list-timers'


## fd-find
alias fd='fdfind'
alias ff='fdfind --type file'
alias fdd='fdfind --type directory'
alias fdmax='fdfind -d 50'
alias fe='fdfind -e'


rga-fzf() {
    RG_PREFIX="rga --files-with-matches"
    xdg-open "$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX $@" \
            fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
                --bind=tab:down,btab:up \
                --phony -q "$1" \
                --bind "change:reload:$RG_PREFIX {q}" \
                --preview-window="70%:wrap"
    )"
}

## kubectl

alias k='kubectl'
alias kc='kubectx "$(kubectx | fzf --height=10%)"'
alias kn='kubens "$(kubens | fzf --height=10%)"'
alias kd='k describe'
alias kd!='kd --all-namespaces'
alias kdp='kd pod'
alias kdel='k delete'
alias ke='k exec -ti'
alias kg='k get'
alias kg!='kg --all-namespaces'
alias kgd='kg deployment'
alias kgd!='kgd --all-namespaces'
alias kgp='kg pod'
alias kgp!='kgp --all-namespaces'
alias kgs='kg service'
alias kgs!='kgs --all-namespaces'
alias kl='kubectl logs -f'

kout() {
    while IFS= read -rd: config; do
        [ -f "$config" ] || continue
        sed -i -E '/^\s*(access-token|expires-in|expires-on|refresh-token)/d' "$config"
    done <<< "${KUBECONFIG:-$HOME/.kube/config}:"
}
