FROM ubuntu:18:04

RUN apt-get update; apt-get upgrade -y
RUN apt-get install -y neovim python3 nodejs wget curl tmux npm git python3-pip wget
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN git clone https://github.com/xcs491/VimEnvironment ~/dev
RUN ~/.fzf/install
RUN mkdir -p ~/.config/nvim/
RUN mv ~/dev/init.vim ~/.config/nvim/init.vim
RUN mv ~/dev/tconfig.sh ~/tconfig.sh
RUN chmod +x ~/tconfig.sh

RUN pip install virtualenv

RUN nvim -c PlugInstall +qall
