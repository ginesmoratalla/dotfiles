#!/usr/bin/env bash

# nvim configuration symlink
echo "Creating Symbolic links..."
echo ""


target_nvim="$HOME/.config/nvim"
source_nvim="$HOME/dotfiles/nvim"

if [ -e "$target_nvim" ]; then
  echo "Nvim symlink already exists"

else
  ln -s "$source_nvim" "$target_nvim"
  echo "Nvim symlink succesfully created"
fi


target_superfile="$HOME/Library/Application Support/superfile"
source_superfile="$HOME/dotfiles/superfile"

if [ -e "$target_superfile" ]; then
  echo "Nvim symlink already exists"

else
  ln -s "$source_superfile" "$target_superfile"
  echo "superfile symlink succesfully created"
fi


# Creating symlink for .zshrc
target_zshrc="$HOME/.zshrc"
source_zshrc="$HOME/dotfiles/.zshrc"

if [ -e "$target_zshrc" ]; then
  echo "zshrc symlink already exists"
else 
  ln -s "$source_zshrc" "$target_zshrc"
  echo "zshrc symlink succesfully created"
fi

# Creating symlink for .tmux.conf
target_tmux="$HOME/.tmux.conf"
source_tmux="$HOME/dotfiles/tmux/.tmux.conf"

if [ -e "$target_tmux" ]; then
  echo "tmux symlink already exists"
else 
  ln -s "$source_tmux" "$target_tmux"
  echo "tmux symlink succesfully created"
fi

# Creating gitconfig symlink
target_gitconfig="$HOME/.gitconfig"
source_gitconfig="$HOME/dotfiles/.gitconfig"

if [ -e "$target_gitconfig" ]; then
  echo "gitconfig symlink already exists"
else 
  ln -s "$source_gitconfig" "$target_gitconfig"
  echo "gitconfig symlink succesfully created"
fi

# Creating kitty symlink
target_kitty="$HOME/.config/kitty"
source_kitty="$HOME/dotfiles/kitty"

if [ -e "$target_kitty" ]; then
  echo "kitty symlink already exists"
else
  ln -s "$source_kitty" "$target_kitty"
  echo "kitty symlink succesfully created"
fi


# Creating hyprland config symlink
# target_hypr="$HOME/.config/hypr"
# source_hypr="$HOME/dotfiles/hypr"
# 
# if [ -e "$target_hypr" ]; then
#   echo "hypr symlink already exists"
# else
#   ln -s "$source_hypr" "$target_hypr"
#   echo "hyprland symlink succesfully created"
# fi

# Creating rofi config symlink
# target_rofi="$HOME/.config/rofi"
# source_rofi="$HOME/dotfiles/rofi"
# 
# if [ -e "$target_rofi" ]; then
#   echo "rofi symlink already exists"
# else
#   ln -s "$source_rofi" "$target_rofi"
#   echo "rofi symlink succesfully created"
# fi

# Creating wofi config symlink
# target_wofi="$HOME/.config/wofi"
# source_wofi="$HOME/dotfiles/wofi"
# 
# if [ -e "$target_wofi" ]; then
#   echo "wofi symlink already exists"
# else
#   ln -s "$source_wofi" "$target_wofi"
#   echo "wofi symlink succesfully created"
# fi

# Creating dunst config symlink
# target_dunst="$HOME/.config/dunst"
# source_dunst="$HOME/dotfiles/dunst"

# if [ -e "$target_dunst" ]; then
#   echo "dunst symlink already exists"
# else
#   ln -s "$source_dunst" "$target_dunst"
#   echo "dunst symlink succesfully created"
# fi

# Creating swaylock config symlink
# target_swaylock="$HOME/.config/swaylock"
# source_swaylock="$HOME/dotfiles/swaylock"
# 
# if [ -e "$target_swaylock" ]; then
#   echo "swaylock symlink already exists"
# else
#   ln -s "$source_swaylock" "$target_swaylock"
#  echo "swaylock symlink succesfully created"
#fi

# Creating wlogout config symlink
# target_wlogout="$HOME/.config/wlogout"
# source_wlogout="$HOME/dotfiles/wlogout"

# if [ -e "$target_wlogout" ]; then
#   echo "wlogout symlink already exists"
# else
#   ln -s "$source_wlogout" "$target_wlogout"
#   echo "wlogout symlink succesfully created"
# fi

# Creating qt5ct config symlink
# target_qt5ct="$HOME/.config/qt5ct"
# source_qt5ct="$HOME/dotfiles/qt5ct"
# 
# if [ -e "$target_qt5ct" ]; then
#   echo "qt5ct symlink already exists"
# else
#   ln -s "$source_qt5ct" "$target_qt5ct"
#   echo "qt5ct symlink succesfully created"
# fi

# Creating waybar config symlink
#target_waybar="$HOME/.config/waybar"
#source_waybar="$HOME/dotfiles/waybar"

# if [ -e "$target_waybar" ]; then
#   echo "waybar symlink already exists"
# else
#   ln -s "$source_waybar" "$target_waybar"
#   echo "waybar symlink succesfully created"
# fi

# Creating starship config symlink
target_starship="$HOME/.config/starship.toml"
source_starship="$HOME/dotfiles/starship/starship.toml"

if [ -e "$target_starship" ]; then
  echo "starship symlink already exists"
else
  ln -s "$source_starship" "$target_starship"
  echo "starship symlink succesfully created"
fi


# Creating ghostty config symlink
target_ghostty="$HOME/.config/ghostty"
source_ghostty="$HOME/dotfiles/ghostty"

if [ -e "$target_ghostty" ]; then
  echo "ghostty symlink already exists"
else
  ln -s "$source_ghostty" "$target_ghostty"
  echo "ghostty symlink succesfully created"
fi

