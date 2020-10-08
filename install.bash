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
  nvim_image=nvim.appimage
  nvim_image_path=https://github.com/neovim/neovim/releases/download/nightly/
  wget -c -O /tmp/${nvim_image} ${nvim_image_path}/${nvim_image} || { echo Neovim install failed!!!;  exit 1; }
  sudo cp -f /tmp/${nvim_image} /usr/bin \
    && sudo chmod +x /usr/bin/${nvim_image} \
    && sudo ln -sf /usr/bin/${nvim_image} /usr/bin/nvim \
    && echo Neovim installed done!!!
fi

# Check and install node.js
if [ ! ${force} ] && (node -v &>> /dev/null); then
  echo Node.js already installed
else
  echo Installing Node.js...
  curl -sL install-node.now.sh/lts > /tmp/install_node.bash || { echo Node.js install failed!!!;  exit 1; }
  sudo bash /tmp/install_node.bash -y || { echo Node.js install failed!!!;  exit 1; }
  echo Node.js install done!!!
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

echo ""
echo Install done!!!

