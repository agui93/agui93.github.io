#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 安装vim插件
#vim -c PlugInstall -c q -c q

# 安装插件运行需要依赖的一些组件
#cd /root/.vim/bundle/YouCompleteMe/ && python3 install.py --clang-complete &&  python3 install.py --clangd-completer
cd /root/.vim/plugged/YouCompleteMe/ 
git submodule update --init --recursive
cd /root/.vim/plugged/YouCompleteMe/ && python3 install.py --clang-complete


