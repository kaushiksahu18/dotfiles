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
# zinit light jeffreytse/zsh-vi-mode
# Ensure zsh-vi-mode loads last, with bindkey commands applied after it loads
zinit atload"bindkey '^[[A' history-beginning-search-backward; bindkey '^[[B' history-beginning-search-forward" \
  for jeffreytse/zsh-vi-mode
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
alias ls='eza --classify=always --color=always --icons=always'
alias cat='bat'
alias nman='tldr'
alias cod='code'
alias vim='nvim'
alias vi='nvim'
alias btop='btop --utf-force'
alias zed='zeditor'

alias c='clear'

alias cp='cp -Rifv'
alias mv='mv -ifv'
alias rm='rm -Rifv'

alias sizeof='du -sh'

alias toggleport="$HOME/dotfiles/scripts/toggleport.sh"

alias ghce='gh copilot explain'
alias ghcs='gh copilot suggest'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval $(thefuck --alias)

export PATH=$HOME/.local/bin:$PATH
export BROWSER=brave

# bun completions
[ -s "/home/kaushiksahu18/.bun/_bun" ] && source "/home/kaushiksahu18/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/kaushiksahu18/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
