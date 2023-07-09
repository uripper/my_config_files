
export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Jxck/dotfiles package as a command
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# tcnksm/docker-alias package for zshrc
zplug "tcnksm/docker-alias", use:zshrc

# k4rthik/git-cal command (disabled updates)
zplug "k4rthik/git-cal", as:command, frozen:1

# Plugins from oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# Prezto module
zplug "modules/prompt", from:prezto

# Other plugins
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60
zplug "b4b4r07/79ee61f7c140c63d2786", from:gist, as:command, use:get_last_pane_path.sh
zplug "b4b4r07/hello_bitbucket", from:bitbucket, as:command, use:"*.sh"
zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'

# Local plugins
zplug "~/.zsh", from:local

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
