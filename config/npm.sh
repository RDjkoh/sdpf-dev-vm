#!/bin/bash

NPM_CONFIG_PREFIX=$HOME/.npm-global

echo $NPM_CONFIG_PREFIX 
if [ ! -d "$NPM_CONFIG_PREFIX" ]; then
  mkdir $NPM_CONFIG_PREFIX
fi

npm config set prefix $NPM_CONFIG_PREFIX

if [[ ! "$PATH" == ?(*:)"$NPM_CONFIG_PREFIX/bin"?(:*) ]]; then
  echo "export PATH=$NPM_CONFIG_PREFIX/bin:$PATH" >> $HOME/.profile
fi

source $HOME/.profile

