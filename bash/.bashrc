#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for non-login shells.

. "$DOTFILES/bash/.bashrc_common"

if [ $IS_WORK_PROFILE = "yes" ] ; then
  . "$DOTFILES/bash/.bashrc_work"
else
  . "$DOTFILES/bash/.bashrc_personal"
fi
