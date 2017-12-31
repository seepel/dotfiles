#!/bin/zsh

if [ ! -e "$HOME/.zshrc" ]; then 
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
  chsh -s /bin/zsh
  rm .zshrc
  rm .zpreztorc

  ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
  ln -s $HOME/dotfiles/zpreztorc $HOME/.zpreztorc
  ln -s $HOME/dotfiles/vim $HOME/.vim
  ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
else
  echo "prezto already installed"
fi

if [ ! -e "$HOME/.gemrc" ]; then
  echo "gem: -n/usr/local/bin" >> "$HOME/.gemrc"
fi

mkdir ~/.nvm

ln -s "$HOME/dotfiles/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
ln -s "$HOME/dotfiles/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json" 

