#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

#-------------------------------------------------------------------------------
# Path and XDG Base Directories
#-------------------------------------------------------------------------------

export DOTFILES="$HOME/.dotfiles"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$DOTFILES/scripts:$PATH"

# XDG - set defaults as they are not usually set on Ubuntu
# See: https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

if [ ! -w "${XDG_RUNTIME_DIR:="/run/user/$UID"}" ]; then
  echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Unsetting." >&2
  unset XDG_RUNTIME_DIR
else
  export XDG_RUNTIME_DIR
fi

#-------------------------------------------------------------------------------
# Clean up home directory
#-------------------------------------------------------------------------------

export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export HISTFILE="$XDG_DATA_HOME"/bash/history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export LESSHISTFILE=- # disable less history
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

#-------------------------------------------------------------------------------
# Default programs
#-------------------------------------------------------------------------------

export BROWSER=google-chrome
export EDITOR=~/.local/bin/nvim.appimage

#-------------------------------------------------------------------------------
# Haskell
#-------------------------------------------------------------------------------

# ghcup for Haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# IHP and dependencies
[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ] &&
  source "$HOME/.nix-profile/etc/profile.d/nix.sh" &&
  export IHP_BROWSER=google-chrome &&
  eval "$(direnv hook bash)"

# Hackage user details
[ -f "$HOME/.hackage_userinfo.sh" ] && source "$HOME/.hackage_userinfo.sh"

#-------------------------------------------------------------------------------
# Java
#-------------------------------------------------------------------------------

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/usr/local/jdk1.7.0/bin:$PATH"
export PATH="/usr/local/javacc/javacc-javacc-7.0.10/scripts:$PATH"
export PATH="/opt/gradle/gradle-6.4.1/bin:$PATH"

#-------------------------------------------------------------------------------
# Nix
#-------------------------------------------------------------------------------

[ -e /home/farbod/.nix-profile/etc/profile.d/nix.sh ] &&
  . /home/farbod/.nix-profile/etc/profile.d/nix.sh

#-------------------------------------------------------------------------------
# TexLive
#-------------------------------------------------------------------------------

export PATH="/usr/local/texlive/2019/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2019/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2019/texmf-dist/doc/info:$INFOPATH"

#-------------------------------------------------------------------------------
# bashrc
#-------------------------------------------------------------------------------

[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
