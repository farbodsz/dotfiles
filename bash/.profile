#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.

_is_work_profile=
case "$(hostname)" in
  ldz*) _is_work_profile="yes" ;;
esac
export IS_WORK_PROFILE="$_is_work_profile"

if [ $IS_WORK_PROFILE = "yes" ]; then
  . "$HOME/.profile_work"
else
  . "$HOME/.profile_personal"
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$DOTFILES/scripts:$PATH"

#-------------------------------------------------------------------------------
# Clean up home directory
#-------------------------------------------------------------------------------

export HISTFILE="$XDG_DATA_HOME"/bash/history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export LESSHISTFILE=- # disable less history
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

#-------------------------------------------------------------------------------
# Default programs
#-------------------------------------------------------------------------------

export BROWSER=google-chrome
export EDITOR=nvim.appimage

#-------------------------------------------------------------------------------
# bashrc
#-------------------------------------------------------------------------------

[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
