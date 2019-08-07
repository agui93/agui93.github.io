From ubuntu:16.04
RUN apt-get update && apt-get install -y gdb git make g++ gcc build-essential cmake python3-dev ctags vim
RUN apt-get install -y clang
RUN apt-get install -y curl 


ADD ./vimrc /root/.vimrc
ADD ./vim_plugins_install.sh /root/vim_plugins_install.sh
RUN ["chmod", "+x", "/root/vim_plugins_install.sh"]
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 安装vim插件
RUN vim -c PlugInstall -c q -c q
RUN /root/vim_plugins_install.sh
RUN rm /root/vim_plugins_install.sh

