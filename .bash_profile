export PATH="$HOME/bin:/usr/local/bin:/usr/local/texlive/2011/bin/x86_64-darwin:/Library/Frameworks/GDAL.framework/Programs:$PATH"

export PROMPT_COMMAND="source $HOME/bin/prompt_command"

# use vi everywhere!
echo "Using vi everywhere..."
export EDITOR=vi
export VISUAL=vi
set -o vi

# setup android
export PATH=$HOME/src/android-ndk-r8b:$HOME/src/android-sdk-macosx/tools:$HOME/src/android-sdk-macosx/platform-tools:$PATH
export NDK_ROOT=$HOME/src/android-ndk-r8b

echo "Setting history file size"
HISTFILESIZE=1000000000
HISTSIZE=1000000

echo "Setting aliases for other computers..."
alias lxplus="ssh -X lxplus.cern.ch"
alias mother="ssh mother.local"
alias hal="ssh hal.local"
alias wopr="ssh wopr.macminicolo.net"
alias ndcms="ssh -XY slynch2@ndcms.crc.nd.edu"
alias earth="ssh -XY slynch2@earth.crc.nd.edu"
alias opteron="ssh -XY slynch2@opteron.crc.nd.edu"
alias mailmenu="ssh slynch_mailmenu@ssh.phx.nearlyfreespeech.net"

echo "Setting startnote function..."
function startnote {
  if [ ! -z "$1" ]; then
     vim "$HOME/Documents/notes/$1"
  else
    echo "Usage: startnote <note name>"
  fi
}

alias scpresume="rsync --partial --progress --rsh=ssh"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
