sudo apt update; sudo apt dist-upgrade

# installing polybar & i3
sudo apt install polybar i3

#installing picom
# Download latest zip file from : https://github.com/yshui/picom/releases
cd ~
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev
git clone https://github.com/yshui/picom.git --branch v11.1
cd picom
meson setup --buildtype=release build
ninja -C build
ninja -C build install

# Other Programs
sudo apt install git curl wget bat neofetch nodejs npm nitrogen eza neovim
