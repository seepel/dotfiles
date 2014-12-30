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

echo Install all AppStore Apps at first!
# no solution to automate AppStore installs
read "?Press any key to continue..."
echo  '\n'

function run_install() {
  cmd="$1"
  executable="$2"
  package="$3"
  if [ ! -e "$executable" ]; then
    ${=cmd} "$package"
  else
    echo "$executable already installed... skipping"
  fi
}

function brew_install() {
  run_install "brew install" "/usr/local/bin/$1" "$2"
}

function cask_install() {
  appdir="Applications"
  run_install "brew-cask install --appdir=\"/$appdir\"" "/$appdir/$1" "$2"
}

 
#echo Install and Set San Francisco as System Font
#ruby -e "$(curl -fsSL https://raw.github.com/wellsriley/YosemiteSanFranciscoFont/master/install)"
echo Install Homebrew, and cask
if [ ! -e '/usr/local/bin/brew' ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew doctor
fi

brew_install "wget" "wget"
brew_install "brew-cask" "brew-cask"
brew tap caskroom/versions

cask_install "BetterTouchTool.app" "bettertouchtool"
cask_install "Charles.app" "charles"
cask_install "DropBox.app" "dropbox"
cask_install "Google Chrome.app" "google-chrome"
should_open_little_snitch=false
if [ ! -e '/Applications/Little Snitch Configuration.app' ]; then
  should_open_little_snitch=true
fi
cask_install "Little Snitch Configuration.app" "little-snitch"
cask_install "Firefox.app" "firefox"
cask_install "Skype.app" "skype"
cask_install "Spotify.app" "spotify"
cask_install "SourceTree.app" "sourcetree"
cask_install "Sublime Text.app" "sublime-text3"

if [ ! -e "$HOME/.gemrc" ]; then
  echo "gem: -n/usr/local/bin" >> "$HOME/.gemrc"
fi
gem install cocoapods

brew cleanup --force
find /Library/Caches/Homebrew -mindepth 1 -delete

if [ "$should_open_little_snitch" = true ]; then
  open "/Applications/Little Snitch Configuration.app"
fi
