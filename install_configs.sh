#!/bin/bash

# Make needed dirs
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fish
mkdir -p ~/.config/rofi
mkdir -p ~/.config/dunst
mkdir -p ~/.config/awesome
mkdir -p ~/.config/helix

# Link the configs
ln -sf "$(pwd)/alacritty.yml" ~/.config/alacritty/alacritty.yml
ln -sf "$(pwd)/config.fish" ~/.config/fish/config.fish
ln -sf "$(pwd)/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$(pwd)/dunstrc" ~/.config/dunst/dunstrc
ln -sf "$(pwd)/awesome_config.lua" ~/.config/awesome/rc.lua
ln -sf "$(pwd)/awesome_themes" ~/.config/awesome/themes
ln -sf "$(pwd)/aliases" ~/.aliases
ln -sf "$(pwd)/Xresources" ~/.Xresources
ln -sf "$(pwd)/gitconfig" ~/.gitconfig
ln -sf "$(pwd)/helix_languages.toml" ~/.config/helix/languages.toml
ln -sf "$(pwd)/helix_config.toml" ~/.config/helix/config.toml

sudo ln -sf "$(pwd)/pixellock" /usr/bin/pixellock

# Install minimal stuff
sudo pacman -S alacritty awesome rofi nitrogen picom volumeicon helix  --needed --noconfirm

# Extend .bashrc
echo "[[ -f '$(pwd)/aliases' ]] && source $(pwd)/aliases " >> ~/.bashrc
echo "fish " >> ~/.bashrc
