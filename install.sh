sudo apt update && apt upgrade -y

sudo apt install -y zsh ranger curl stow neofetch zip unzip gh build-essentials

sudo chsh -s $(which zsh) $(whoami)

curl -sS https://starship.rs/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts && nvm use --lts

# Git Submodule Initialization
git submodule update --init
