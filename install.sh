# Update the system
sudo apt update; sudo apt dist-upgrade

# Install:
sudo apt install zsh trash-cli i3 bat git stow curl wget nodejs npm nitrogen eza neofetch vlc tmux neovim okular cmake tree zsh whois btop acpi net-tools netdiscover pip kitty pulseaudio gcc light ripgrep fzf brightnessctl
sudo snap install nvim
pip3 install tldr

chsh -s $(which zsh)

# Installing picom
install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
git clone https://github.com/jonaburg/picom
cd picom
meson --buildtype=release . build
sudo ninja -C build install

# Setting up git client
git config --global user.name "<username>"
git config --global user.email "<email>"
git config --global init.defaultBranch main
git config --global color.ui auto

git config --get user.name
git config --get user.email

ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub

ssh -T git@github.com
