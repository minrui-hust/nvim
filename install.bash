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

# Check and install neovim
if [ ! ${force} ] && (nvim -v &>> /dev/null); then
  echo Neovim already installed
else
  echo Installing neovim...
  nvim_image=nvim-linux-x86_64.tar.gz
  nvim_image_path=https://github.com/neovim/neovim/releases/download/stable
  wget -c -O /tmp/${nvim_image} ${nvim_image_path}/${nvim_image} || { echo Neovim install failed!!!;  exit 1; }
  mkdir -p ${HOME}/.local
  tar xzf /tmp/${nvim_image} -C ${HOME}/.local/
  sudo ln -s ${HOME}/.local/nvim-linux-x86_64/bin/nvim /usr/bin/nvim \
    && echo Neovim installed done!!!
fi

# Check and install node.js
if [ ! ${force} ] && (node -v &>> /dev/null); then
  echo Node.js already installed
else
  echo Installing Node.js...
  wget install-node.now.sh/lts -O /tmp/install_node.bash || { echo Node.js install failed!!!;  exit 1; }
  sudo bash /tmp/install_node.bash -y || { echo Node.js install failed!!!;  exit 1; }
  echo Node.js install done!!!
fi

# Check and install pip3
if ! (pip3 --version &>> /dev/null); then
  sudo apt install python3-pip -y
fi

# Check and install ranger
if [ ! ${force} ] && (ranger --version &>> /dev/null); then
  echo Ranger is already installed
else
  echo Installing ranger...
  pip3 install ranger-fm || { echo Ranger install failed!!!;  exit 1; }
  echo Ranger install done!!!
fi

# Check and install repgrep
if [ ! ${force} ] && (rg --version &>> /dev/null); then
  echo Ripgrep already installed
else
  echo Installing ripgrep...
  rg_pkg=ripgrep_12.1.1_amd64.deb 
  rg_pkg_path=https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/
  wget -c -O /tmp/${rg_pkg} ${rg_pkg_path}/${rg_pkg} || { echo Ripgrep install failed!!!;  exit 1; }
  sudo dpkg -i /tmp/${rg_pkg}  || { echo Ripgrep install failed!!!;  exit 1; }
  echo Ripgrep installed done!!!
fi

# Check and install pynvim
if [ !${force} ] && (pip3 list | grep pynvim &>> /dev/null); then
  echo Pynvim already installed!!!
else
  pip3 install pynvim || { echo pynvim install failed!!!; exit 1; }
  echo Pynvim installed done!!!
fi

# Check and install neovim-remote
if [ !${force} ] && (pip3 list | grep neovim-remote &>> /dev/null); then
  echo Neovim-remote already installed!!!
else
  pip3 install neovim-remote || { echo neovim-remote install failed!!!; exit 1; }
  echo Neovim-remote installed done!!!
fi

# Install bat
if [ ! ${force} ] && (bat --version &>> /dev/null); then
  echo Bat already installed
else
  echo Installing bat...
  pkg=bat_0.16.0_amd64.deb
  pkg_path=https://github.com/sharkdp/bat/releases/download/v0.16.0/
  wget -c -O /tmp/${pkg} ${pkg_path}/${pkg} || { echo Bat install failed!!!;  exit 1; }
  sudo dpkg -i /tmp/${pkg}  || { echo Bat install failed!!!;  exit 1; }
  echo Bat installed done!!!
fi

# Install xsel
echo Installing bat...
sudo apt install xsel -y

# Install nerd font
sudo apt install unzip -y

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

if [ ! ${force} ] && (fc-list | grep 'FiraCode' &>> /dev/null); then
  echo FiraCode Font already installed
else
  echo Installing FiraCode Font...
  font_dir=~/.local/share/fonts
  pkg=FiraCode.zip
  pkg_path=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/
  mkdir -p ${font_dir} || { echo Failed to create \'${font_dir}\' directory!!!;  exit 1; }
  wget -c -O /tmp/${pkg} ${pkg_path}/${pkg} || { echo Failed to download FiraCode font !!!;  exit 1; }
  unzip /tmp/${pkg} -d ${font_dir} && fc-cache -vf ${font_dir} || { echo Install FiraCode font failed!!!;  exit 1; }
  echo FiraCode font installed done!!!
fi

echo ""
echo Install done!!!

