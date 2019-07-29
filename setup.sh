# Run :UpdateRemotePlugins from neovim to update if deoplete doesn't work
## VARIABLES
VERNODEJS="https://deb.nodesource.com/setup_10.x"
VERPYTH="3.7.3"
HOMEDIR=$(pwd)

# create password for user
sudo passwd $(whoami)

# Add NVIM stable repository
echo 'sudo add-apt-repository ppa:neovim-ppa/stable if on ubuntu'

# Node JS repo
curl -sL $VERNODEJS | sudo -E bash -
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
mkdir -p Python/$VERPYTH
cd Python/$VERPYTH/
# Python compile
wget https://www.python.org/ftp/python/$VERPYTH/Python-$VERPYTH.tar.xz
tar -xf Python-$VERPYTH.tar.xz
cd Python-$VERPYTH/
sudo ./configure --enable-optimizations --with-zlib-dir=/usr/local/lib
sudo make
sudo make install
rm ~/Python/$VERPYTH/Python-$VERPYTH.tar.xz
# Upgrade pip and install virtual env
sudo ./python -m pip install --upgrade pip
sudo ./python -m pip install virtualenv
sudo ./python -m pip install pynvim

# Install Vue Cli 3
sudo npm install -g @vue/cli

# Install rust
sudo curl https://sh.rustup.rs -sSf | sh

# Change shell to zsh as default
chsh -s $(which zsh)

cd ~/

# Modify nvim config to match python
echo "let g:python3_host_prog='$HOMEDIR/Python/$VERPYTH/Python-$VERPYTH/python'" >> ~/.config/nvim/init.vim
echo "let g:deoplete#enable_at_startup = 1" >> ~/.config/nvim/init.vim


echo "Run :UpdateRemotePlugins from neovim to update if deoplete doesn't work"
