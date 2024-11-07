# My Dotfiles

## Install The Packages

```sh
yay -S brave-bin extension-manager gdm-settings postman-bin wireshark-qt sticky-notes nerdfetch visual-studio-code-bin zen-browser-avx2-bin banana-cursor-bin bun-bin google-chrome
```

### Install

```sh
sudo pacman -S kitty zsh starship cheese obs-studio obsidian libreoffice-fresh shotcut flameshot btop neofetch bat eza fzf tldr zoxide tmux nmap mpv ducker pnpm nodejs rustup lazygit httpie procs speedtest-cli thefuck yazi neovim ttf-fira-code zed rate-mirrors pinta dconf-editor drawio-desktop
```

### Update the Mirror list

```sh
rate-mirrors --protocol https --allow-root --entry-country IN endeavouros | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist
```

- [x] OS: EndeavourOS
- [x] DE: GNOME
- [x] WM: Mutter
- [x] Shell: zsh
- [x] Terminal: kitty
- [x] Editor: VSCode, Zed, Neovim
- [x] Browser: Brave, Zen
- [x] Languages: C/C++, Java, Python, JS, Rust, Go
- [x] **Application**:
  - [x] Extensions Manager
  - [x] GDM Settings
  - [x] Cheese.
  - [x] OBS
  - [x] Docker
  - [x] Postman
  - [x] Wireshark
  - [x] Insomnia
  - [x] LibreOffice
  - [x] mpv
  - [x] shotcut
  - [x] Sticky Notes
  - [x] flameshot
- [x] **CLI/TUI**
  - [x] Btop
  - [x] neofetch
  - [x] bat
  - [x] eza
  - [x] fzf
  - [x] tldr
  - [x] zoxide
  - [x] starship
  - [x] pnpm
  - [x] bun
  - [x] node
  - [x] rustup
  - [x] lazygit
  - [x] tmux
  - [x] httpie
  - [x] procs
  - [x] nerdfetch
  - [x] nmap
  - [x] speedtest-cli
  - [x] yazi
  - [x] thefuck
