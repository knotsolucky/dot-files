brew tap homebrew/autoupdate
brew tap homebrew/bundle
brew tap homebrew/services

brew install wget
brew install npm
brew install git
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install eza
brew install zoxide
brew install neovim
brew install tmux
brew install starship
brew install assh
brew install fastfetch
brew install zip
brew install unzip
brew install stow
brew install lazygit
brew install tpm
brew install bash
brew install bat
brew install docker
brew install gcc
brew install ffmpeg
brew install go
brew install mysql
brew install mysql@8.0
brew install neofetch
brew install node
brew install openjdk
brew install openvpn
brew install putty
brew install python@3.11
brew install rust
brew install tree
brew install luarocks
brew install lua@5.1
brew install btop
brew install clang
brew install lazydocker
brew install fzf
brew install gh
brew install gitui
brew install yazi
brew install vim-plug

# Base system
sudo pacman -S --noconfirm base
sudo pacman -S --noconfirm base-devel
sudo pacman -S --noconfirm linux
sudo pacman -S --noconfirm linux-firmware
sudo pacman -S --noconfirm linux-headers
sudo pacman -S --noconfirm amd-ucode
sudo pacman -S --noconfirm efibootmgr
sudo pacman -S --noconfirm dkms
sudo pacman -S --noconfirm pacman-contrib
sudo pacman -S --noconfirm zram-generator

# Editors & CLI tools
sudo pacman -S --noconfirm nano
sudo pacman -S --noconfirm vim
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm htop
sudo pacman -S --noconfirm btop
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm git

# Networking
sudo pacman -S --noconfirm networkmanager
sudo pacman -S --noconfirm network-manager-applet
sudo pacman -S --noconfirm iwd
sudo pacman -S --noconfirm bluez-utils
sudo pacman -S --noconfirm wireless_tools
sudo pacman -S --noconfirm ufw

# Audio
sudo pacman -S --noconfirm pipewire
sudo pacman -S --noconfirm pipewire-alsa
sudo pacman -S --noconfirm pipewire-jack
sudo pacman -S --noconfirm pipewire-pulse
sudo pacman -S --noconfirm wireplumber
sudo pacman -S --noconfirm libpulse
sudo pacman -S --noconfirm gst-plugin-pipewire

# GUI / Desktop
sudo pacman -S --noconfirm plasma-meta
sudo pacman -S --noconfirm plasma-workspace
sudo pacman -S --noconfirm dolphin
sudo pacman -S --noconfirm ark
sudo pacman -S --noconfirm kate
sudo pacman -S --noconfirm konsole
sudo pacman -S --noconfirm xorg-xinit
sudo pacman -S --noconfirm xdg-utils

# Terminals
sudo pacman -S --noconfirm alacritty
sudo pacman -S --noconfirm kitty
sudo pacman -S --noconfirm ghostty

# Fonts
sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
sudo pacman -S --noconfirm otf-geist-mono-nerd

# Dev tools and libraries
sudo pacman -S --noconfirm typescript
sudo pacman -S --noconfirm npm
sudo pacman -S --noconfirm meson
sudo pacman -S --noconfirm gjs
sudo pacman -S --noconfirm gtk3
sudo pacman -S --noconfirm gtk-layer-shell
sudo pacman -S --noconfirm gnome-bluetooth-3.0
sudo pacman -S --noconfirm upower
sudo pacman -S --noconfirm gobject-introspection
sudo pacman -S --noconfirm python-gobject
sudo pacman -S --noconfirm libdbusmenu-gtk3
sudo pacman -S --noconfirm libsoup3
sudo pacman -S --noconfirm dart-sass
sudo pacman -S --noconfirm libgtop
sudo pacman -S --noconfirm freeglut
sudo pacman -S --noconfirm smartmontools

# Apps and tools
sudo pacman -S --noconfirm obsidian
sudo pacman -S --noconfirm discord
sudo pacman -S --noconfirm steam
sudo pacman -S --noconfirm 1password
sudo pacman -S --noconfirm rofi
sudo pacman -S --noconfirm swww
sudo pacman -S --noconfirm wl-clipboard
sudo pacman -S --noconfirm dunst
sudo pacman -S --noconfirm brightnessctl
sudo pacman -S --noconfirm power-profiles-daemon
sudo pacman -S --noconfirm mangohud
sudo pacman -S --noconfirm egl-wayland
sudo pacman -S --noconfirm gvfs
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm mesa-demos

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm


yay -S aylurs-gtk-shell-git --noconfirm
yay -S spotify-launcher --noconfirm
yay -S yay --noconfirm
yay -S yazi --noconfirm
yay -S zen-browser-bin --noconfirm 

curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password
makepkg -si

cp -a . HomeDirectoryFiles/Linux/ ~/.
