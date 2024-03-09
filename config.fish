# starship
starship init fish | source

# zoxide
zoxide init --cmd cd fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
