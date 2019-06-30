sudo apt-get update; sudo apt-get upgrade -y; sudo apt-get install git neovim zsh tmux
mkdir ~/.config/nvim; mkdir ~/gits; mkdir ~/.config/nvim/autoload
cd ~/gits; git clone https://github.com/xcs491/VimEnvironment.git
cd ~/.config/nvim/autoload; wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp init.vim ~/.config/nvim; cp tconfig.sh ~/
cd ~/; sudo sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/gits/VimEnvironment/aaron.zsh-theme ~/.oh-my-zsh/themes/
cp ~/gits/VimEnvironment/.zshrc ~/
