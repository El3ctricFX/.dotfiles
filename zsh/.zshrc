# yawn3k ZSH config
autoload -U colors && colors
PS1="%n@%M (%~) > "

# Default Software
export EDITOR='nvim'
export TERMINAL='kitty'
export BROWSER='brave-browser'
export FILE='nemo'



# History
HISTFILE=~/.zsh_hist
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Shell Integrations
eval "$(fzf --zsh)"

# ZINIT / a plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ZINIT plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Auto completions
autoload -Uz compinit && compinit
_comp_options+=(globdots)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


#╔════════════════════════════════════════════════════════╕
#║		Link Alias File to .bashrc	          │
#╚════════════════════════════════════════════════════════╛

if [ -e $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
fi

fastfetch
