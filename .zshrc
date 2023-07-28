export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX=true
source ~/zsh-async/async.zsh
source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.zsh/aliases.zsh
source ~/.zsh/evals.zsh
source ~/.zsh/exports.zsh

# Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Lazyman shell initialization
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

# Bob neovim version manager path
[ -d ${HOME}/.local/share/bob/nvim-bin ] && export PATH="${HOME}/.local/share/bob/nvim-bin${PATH:+:${PATH}}"

# Zplug initialization
export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Zplug plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "akarzim/zsh-docker-aliases"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "djui/alias-tips"

# Powerlevel10k theme
zplug 'romkatv/powerlevel10k', as:theme
# Install plugins if not installed
if ! zplug check --verbose; then
        zplug install
fi

# Additional configurations
source ~/.zsh/exports.zsh

## Ones that don't wor well with zplug
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /home/ubumonkey/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load plugins
zplug load --verbose
