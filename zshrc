#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
echo "Using vi everywhere..."
export EDITOR=vi
export VISUAL=vi
set -o vi

alias scpresume="rsync --partial --progress --rsh=ssh"

export RBENV_ROOT="$(brew --prefix rbenv)"
export GEM_HOME="$(brew --prefix)"
export GEM_HOME="$(brew --prefix)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
