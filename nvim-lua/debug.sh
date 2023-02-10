#!/usr/bin/sh
NVIM_DEBUG=~/.config/nvim-debug
export NVIM_DEBUG
rm -rf $NVIM_DEBUG
mkdir -p $NVIM_DEBUG/share
mkdir -p $NVIM_DEBUG/nvim

stow --restow --target=$NVIM_DEBUG/nvim .

alias ndb='XDG_DATA_HOME=$NVIM_DEBUG/share XDG_CONFIG_HOME=$NVIM_DEBUG nvim'
