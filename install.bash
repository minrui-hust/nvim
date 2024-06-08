#! /bin/bash

# Give an error when expanding an unset variable
set -u

force=
stable=

help(){
  cat << EOF
Usage: $0 [options]
  --help         Show this message
  --stable       Install stable version of neovim, default is develop version, 
                 cause many useful feature depends on it
  --force        Force install even if already installed
EOF
}

for opt in $@; do
  case $opt in
    --help)
      help
      exit 0
      ;;
    --stable)
      stable=1
      ;;
    --force)
      force=1
      ;;
    *)
      echo "Unknow option: $opt"
      help
      exit 1
      ;;
  esac 
done

# install apt dependencies
apt-get update && apt-get install -y \
  wget \
  curl \
  xsel \
  zip unzip \
  bat \
  ripgrep \
  python3-pip \
  python3-pynvim \
  ranger

# Check and install neovim
if [ ! ${force} ] && (nvim -v &>> /dev/null); then
  echo Neovim already installed
else
  echo Installing neovim...
  nvim_image=nvim-linux64.tar.gz
  nvim_image_path=https://github.com/neovim/neovim/releases/download/stable
  wget -c -O /tmp/${nvim_image} ${nvim_image_path}/${nvim_image} || { echo Neovim install failed!!!;  exit 1; }
  mkdir -p ${HOME}/.local
  tar xzf /tmp/${nvim_image} -C ${HOME}/.local/
  ln -s ${HOME}/.local/nvim-linux64/bin/nvim /usr/bin/nvim \
    && echo Neovim installed done!!!
fi

# Check and install node.js
if [ ! ${force} ] && (node -v &>> /dev/null); then
  echo Node.js already installed
else
  echo Installing Node.js...
  wget install-node.now.sh/lts -O /tmp/install_node.bash || { echo Node.js install failed!!!;  exit 1; }
  bash /tmp/install_node.bash -y || { echo Node.js install failed!!!;  exit 1; }
  echo Node.js install done!!!
fi

# Install Hack Nerd Font
if [ ! ${force} ] && (fc-list | grep 'Hack Nerd Font' &>> /dev/null); then
  echo Hack Nerd Font already installed
else
  echo Installing Hack Nerd Font...
  font_dir=~/.local/share/fonts
  pkg=Hack.zip
  pkg_path=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/
  mkdir -p ${font_dir} || { echo Failed to create \'${font_dir}\' directory!!!;  exit 1; }
  wget -c -O /tmp/${pkg} ${pkg_path}/${pkg} || { echo Failed to download Hack Nerd Font!!!;  exit 1; }
  unzip /tmp/${pkg} -d ${font_dir} && fc-cache -vf ${font_dir} || { echo Install Hack Nerd Font failed!!!;  exit 1; }
  echo Hack Nerd Font installed done!!!
fi

echo ""
echo Install done!!!

