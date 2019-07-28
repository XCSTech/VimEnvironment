# Run :UpdateRemotePlugins from neovim to update if deoplete doesn't work

# create password for user
sudo passwd $(whoami)

# Node JS repo
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# Docker repo
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"


# update and upgrade
sudo apt-get update
sudo apt-get upgrade -y


# Install apps and dependancies for docker/python/node
sudo apt-get install git neovim zsh tmux xz-utils build-essential zlib1g-dev screen libffi-dev libssl-dev openssl nodejs apt-transport-https ca-certificates curl gnupg2 software-properties-common libsqlite3-dev -y
# Install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Install oh my zsh
cd ~/; sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Create needed directories
mkdir -p ~/.config/nvim/autoload
mkdir ~/gits

# Clone dev files needed. Copy files into place
cd ~/gits
git clone https://github.com/xcs491/VimEnvironment.git
cd VimEnvironment
cp init.vim ~/.config/nvim
cp tconfig.sh ~/
cp aaron.zsh-theme ~/.oh-my-zsh/themes/
cp .zshrc ~/

# Load Plug package manager
cd ~/.config/nvim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Make custom python
cd ~/
mkdir -p Python/3.7
cd Python/3.7/
# Python 3.7.3
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
tar -xf Python-3.7.3.tar.xz
cd Python-3.7.3/
sudo ./configure --enable-optimizations --with-zlib-dir=/usr/local/lib
sudo make
sudo make install
rm ~/Python/3.7/Python-3.7.3.tar.xz
# Upgrade pip and install virtual env
sudo ./python -m pip install --upgrade pip
sudo ./python -m pip install virtualenv

# Install Vue Cli 3
sudo npm install -g @vue/cli

# Install rust
sudo curl https://sh.rustup.rs -sSf | sh

# Change shell to zsh as default
chsh -s $(which zsh)

cd ~/

echo "Run :UpdateRemotePlugins from neovim to update if deoplete doesn't work"
