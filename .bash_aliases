# This file is part of Danil Kutkevich <danil@kutkevich.org> home.

# Set PATH so it includes user's private bin if it exists.
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Tab completion
# <http://en.gentoo-wiki.com/wiki/TAB-Completion#Installation>.
[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

export EDITOR="/usr/bin/emacsclient -t"
export ALTERNATE_EDITOR="/usr/bin/emacs"
export PAGER="/usr/bin/less -I"
export HISTSIZE=2000
export HISTCONTROL=ignoredups
# See /usr/share/terminfo/*/
#export TERM=rxvt-256color
#export GIT_PAGER=""

# Aliases.
alias ec='/usr/bin/emacsclient -t'

# Load RVM (Ruby Version Manager) into a shell session *as a function*
# <http://rvm.beginrescueend.com/rvm/install>.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# RVM bash completion <http://beginrescueend.com/workflow/completion>.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# Lua.
if [ -d ~/.luarocks/bin ] ; then
    PATH=~/.luarocks/bin:"${PATH}"
fi
export LUA_PATH="/home/danil/.luarocks/share/lua/5.1//?.lua;./?.lua;$LUA_PATH"
export LUA_CPATH="/home/danil/.luarocks/lib/lua/5.1//?.so;./?.so;$LUA_CPATH"
#export LUA_INIT="require 'luarocks.require'"
