#!/bin/bash

# Make needed dirs
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fish
mkdir -p ~/.config/rofi
mkdir -p ~/.config/dunst
mkdir -p ~/.config/awesome
mkdir -p ~/.config/helix
mkdir -p ~/.config/fontconfig

# link the configs
ln -sf "$(pwd)/alacritty.toml" ~/.config/alacritty/alacritty.toml
ln -sf "$(pwd)/config.fish" ~/.config/fish/config.fish
ln -sf "$(pwd)/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$(pwd)/dunstrc" ~/.config/dunst/dunstrc
ln -sf "$(pwd)/awesome_config.lua" ~/.config/awesome/rc.lua
ln -sf "$(pwd)/awesome_themes" ~/.config/awesome/themes
ln -sf "$(pwd)/awesome_modules" ~/.config/awesome/modules
ln -sf "$(pwd)/aliases" ~/.aliases
ln -sf "$(pwd)/Xresources" ~/.Xresources
ln -sf "$(pwd)/gitconfig" ~/.gitconfig
ln -sf "$(pwd)/helix_languages.toml" ~/.config/helix/languages.toml
ln -sf "$(pwd)/helix_config.toml" ~/.config/helix/config.toml
ln -sf "$(pwd)/profile" ~/.profile
ln -sf "$(pwd)/fonts.conf" ~/.config/fontconfig/fonts.conf

fc-cache

sudo ln -sf "$(pwd)/pixellock" /usr/bin/pixellock


# Install minimal stuff
sudo pacman -S noto-fonts-emoji alacritty awesome rofi nitrogen picom volumeicon xorg \
               helix git base-devel imagemagick dunst xautolock \
               lightdm lightdm-slick-greeter lightdm-gtk-greeter \
               light maim xclip thunar firefox lxappearance network-manager-applet \
               docker blueman wireplumber pipewire-v4l2 pipewire-pulse pipewire-jack \
               pipewire-audio pipewire-alsa pipewire wireshark-qt pavucontrol  \
               rustup cargo-watch cargo-expand cargo-bloat \
               ttf-fira-code tmux fzf inkscape gimp ripgrep \
               arc-icon-theme arc-gtk-theme \
               rofimoji playerctl \
               --needed --noconfirm

# Install yay and that stuff
rm -rf yay
(git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --needed --noconfirm)

yay -S nerd-fonts-complete noto-fonts noto-fonts-cjk noto-fonts-extra ttf-font-awesome ttf-ms-fonts lightdm-settings --needed --noconfirm

# Groups

# sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG wheel $USER
sudo usermod -aG uucp $USER
sudo usermod -aG wireshark $USER

# Enable some services
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl enable lightdm

# Extend .bashrc
echo "[[ -f '$(pwd)/aliases' ]] && source $(pwd)/aliases " >> ~/.bashrc
echo "fish " >> ~/.bashrc
