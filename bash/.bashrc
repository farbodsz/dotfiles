# !/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return ;;
esac

#-------------------------------------------------------------------------------
# History
#-------------------------------------------------------------------------------

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth # no duplicates or commands starting with space
shopt -s histappend    # append to history file, not overwrite

#-------------------------------------------------------------------------------
# XDG Base Directory
#-------------------------------------------------------------------------------

# XDG - set defaults as they are not usually set on Ubuntu
# See: https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"

if [ ! -w ${XDG_RUNTIME_DIR:="/run/user/$UID"} ]; then
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
# Misc
#-------------------------------------------------------------------------------

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Set keyboard layout
setxkbmap -layout us -variant altgr-intl

#-------------------------------------------------------------------------------
# Default programs
#-------------------------------------------------------------------------------

export BROWSER=google-chrome
export EDITOR=~/.local/bin/nvim.appimage

#-------------------------------------------------------------------------------
# Colors
#-------------------------------------------------------------------------------

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color | *-256color) color_prompt=yes ;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
else
  color_prompt=
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *) ;;
esac

# Enable color support in common commands
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" ||
    eval "$(dircolors -b)"

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#-------------------------------------------------------------------------------
# Aliases, styling, and completion
#-------------------------------------------------------------------------------

# Source aliases and custom styling if exist
[ -f ~/.dotfiles/bash/aliases ] && source ~/.dotfiles/bash/aliases
source ~/.dotfiles/bash/styles

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#-------------------------------------------------------------------------------
# Path variable
#-------------------------------------------------------------------------------

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/usr/local/jdk1.7.0/bin:$PATH"
export PATH="/usr/local/javacc/javacc-javacc-7.0.10/scripts:$PATH"
export PATH="/opt/gradle/gradle-6.4.1/bin:$PATH"

#-------------------------------------------------------------------------------
# Node Version Manager
#-------------------------------------------------------------------------------

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#-------------------------------------------------------------------------------
# Haskell
#-------------------------------------------------------------------------------

# ghcup for Haskell
[ -f "/home/farbod/.ghcup/env" ] && source "/home/farbod/.ghcup/env"

# IHP and dependencies
source ~/.nix-profile/etc/profile.d/nix.sh
export IHP_BROWSER=google-chrome
eval "$(direnv hook bash)"

# Hackage user deails
source ~/.hackage_userinfo.sh
