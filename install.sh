sudo apt update && apt upgrade -y

sudo apt install -y zsh ranger curl stow neofetch zip unzip

sudo chsh -s $(which zsh) $(whoami)

curl -sS https://starship.rs/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts && nvm use --lts

# curl -LO https://aka.ms/gcm/linux-install-source.sh
# ./linux-install-source.sh
# git-credential-manager-core configure

# Git Submodule Initialization
git submodule update --init
