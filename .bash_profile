echo "Adding Macports to path..."
export PATH="$HOME/bin:/local/bin:/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/local/man:/opt/local/share/man:$MANPATH"
export INFOPATH="/local/info:/opt/local/share/info:$INFOPATH"

# compiling
echo "Setting compile environment variables..."
export CFLAGS="-I /usr/include/openssl -I/local/include -I/opt/local/include -I /opt/local/lib/eina-0/ -I /opt/local/lib/eina-0/eina/ -L/local/lib -L/opt/local/lib -L/usr/lib"
export CPPFLAGS="$CFLAGS"
export LDFLAGS="-L/local/lib -L/opt/local/lib" 

# pkg-config and autotools
echo "Setting pkg-config and autotools environment variables..."
export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/X11R6/lib/pkgconfig:/local/lib/pkgconfig:/opt/local/lib/pkgconfig"
export ACLOCAL_FLAGS="-I /local/share/aclocal -I /opt/local/share/aclocal -I /usr/share/aclocal"
export PROMPT_COMMAND="source $HOME/bin/prompt_command"

# use vi everywhere!
echo "Using vi everywhere..."
export EDITOR=vi
export VISUAL=vi
set -o vi

echo "Setting history file size"
HISTFILESIZE=1000000000
HISTSIZE=1000000

echo "Setting aliases for other computers..."
alias lxplus="ssh -X lxplus.cern.ch"
alias mother="ssh mother.local"
alias hal="ssh hal.local"
alias wopr="ssh wopr.macminicolo.net"
alias earth="ssh -XY slynch2@earth.crc.nd.edu"
alias opteron="ssh -XY slynch2@opteron.crc.nd.edu"

echo "Setting startnote function..."
function startnote {
  if [ ! -z "$1" ]; then
     vim "$HOME/Documents/notes/$1"
  else
    echo "Usage: startnote <note name>"
  fi
}

alias scpresume="rsync --partial --progress --rsh=ssh"
alias tdrenv="eval `~/Documents/tdr2/notes/tdr runtime -sh`"
