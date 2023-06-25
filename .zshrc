# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH
# export TERM="xterm-256color"
# # Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="powerlevel10k/powerlevel10k"

# plugins=(git z zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

# source $ZSH/oh-my-zsh.sh

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle copyfile
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle lein
antigen bundle pip
antigen bundle screen
antigen bundle tmux
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle HeroCC/LS_COLORS
antigen bundle rupa/z
antigen bundle djui/alias-tips
antigen bundle seletskiy/zsh-fuzzy-search-and-edit
antigen bundle popstas/zsh-command-time
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle changyuheng/zsh-interactive-cd


# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply
source ~/.zsh/aliases.zsh
source ~/.zsh/evals.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
