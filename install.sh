sudo apt update && apt upgrade -y

sudo apt install -y zsh ranger exa curl stow neofetch zip unzip gh build-essential ripgrep python3-pip fd-find

sudo chsh -s $(which zsh) $(whoami)

curl -sS https://starship.rs/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts && nvm use --lts
pip install --user --upgrade pynvim
npm install -g neovim

# symlink the Windows installation of nvim's win32yank.exe to wsl, so that nvim can use " and + registers
#sudo ln -s "/mnt/c/Program Files/nvim-win64/bin/win32yank.exe" "/usr/local/bin/win32yank.exe"

# Git Submodule Initialization
git submodule update --init
