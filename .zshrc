# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
zinit wait lucid for MichaelAquilina/zsh-you-should-use

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='eza'
alias cat='bat'
alias nman='tldr'
alias cod='code'
alias vim='nvim'
alias vi='nvim'
alias btop='btop --utf-force'

alias c='clear'

alias cp='cp -Rifv'
alias mv='mv -ifv'
alias rm='rm -Rifv'

alias sizeof='du -sh'

alias ghce='gh copilot explain'
alias ghcs='gh copilot suggest'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval $(thefuck --alias)

# Catppuccin color palette
local BLACK='#1e1e2e'
local RED='#f38ba8'
local GREEN='#a6e3a1'
local YELLOW='#f9e2af'
local BLUE='#89b4fa'
local MAGENTA='#cba6f7'
local CYAN='#89dceb'
local WHITE='#cdd6f4'
local BRIGHT_BLACK='#45475a'
local BRIGHT_RED='#f38ba8'
local BRIGHT_GREEN='#a6e3a1'
local BRIGHT_YELLOW='#f9e2af'
local BRIGHT_BLUE='#89b4fa'
local BRIGHT_MAGENTA='#cba6f7'
local BRIGHT_CYAN='#89dceb'
local BRIGHT_WHITE='#cdd6f4'

# Set zsh-syntax-highlighting styles to use Catppuccin colors
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

ZSH_HIGHLIGHT_STYLES[comment]=fg=$BRIGHT_BLACK
ZSH_HIGHLIGHT_STYLES[alias]=fg=$MAGENTA
ZSH_HIGHLIGHT_STYLES[builtin]=fg=$CYAN
ZSH_HIGHLIGHT_STYLES[function]=fg=$YELLOW
ZSH_HIGHLIGHT_STYLES[command]=fg=$GREEN
ZSH_HIGHLIGHT_STYLES[precommand]=fg=$GREEN
ZSH_HIGHLIGHT_STYLES[default]=fg=$WHITE
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=$RED
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=$BLUE
ZSH_HIGHLIGHT_STYLES[globbing]=fg=$MAGENTA
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=$BRIGHT_BLACK
ZSH_HIGHLIGHT_STYLES[parameter]=fg=$BLUE
ZSH_HIGHLIGHT_STYLES[operator]=fg=$MAGENTA
ZSH_HIGHLIGHT_STYLES[redirection]=fg=$CYAN
ZSH_HIGHLIGHT_STYLES[separator]=fg=$WHITE
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=$CYAN
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=$YELLOW
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=$YELLOW
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=$GREEN
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=$GREEN
ZSH_HIGHLIGHT_STYLES[backtick]=fg=$RED
ZSH_HIGHLIGHT_STYLES[backtick-quoted-argument]=fg=$GREEN
export PATH=$HOME/.local/bin:$PATH
