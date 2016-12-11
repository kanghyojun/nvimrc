#!/bin/sh
NVIM_DIR="$HOME/.config/nvim"
ln -s "$(pwd)/nvim/init.vim" "$NVIM_DIR/init.vim"

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


nvim +PlugInstall +PlugUpdate +qa
