#!/usr/bin/env bash
# Updates $DISPLAY when re-attaching to long-running tmux sessions
#
# Context:
# When you `ssh -X` into a machine and attach to an existing tmux session, the
# session contains old/stale environment variables, like $DISPLAY. This leads to
# weird behaviour for anything relying on X11 displays, such as getting shared
# clipboards with other users at work.
#
# See:
# https://jira.sqpc.sqrpnt.com/servicedesk/customer/portal/1/HD-77405
#
# Script based off:
# https://github.com/rjmccabe3701/linux_config/blob/fd03106b125a1f9aaf81c9c9a24cdabf03582b2a/scripts/update_display.sh

# When attaching to a session, update $DISPLAY for each pane in the session.
# This is done by using tmux send-keys to the shell. It updates DISPLAY for
# panes running:
#   * zsh
#   * bash
#   * vim/nvim
#   * python
#
# Even if the pane is running one of the above processes, if you exit that
# process (say its running nvim and you exit to the zsh shell), the parent
# process will have the old DISPLAY variable. In these cases manually run the
# script later.

NEW_DISPLAY=$(tmux show-env | sed -n 's/^DISPLAY=//p')

tmux list-panes \
  -s \
  -F "#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}" |
  while read -r pane_process; do
    IFS=' ' read -ra pane_process <<<"$pane_process"
    case "${pane_process[1]}" in
      "bash" | "zsh")
        tmux send-keys -t "${pane_process[0]}" \
          "export DISPLAY=$NEW_DISPLAY" Enter
        ;;
      *"python"*)
        tmux send-keys -t "${pane_process[0]}" \
          "import os; os.environ['DISPLAY']=\"$NEW_DISPLAY\"" Enter
        ;;
      *"vim"*)
        tmux send-keys -t "${pane_process[0]}" Escape
        tmux send-keys -t "${pane_process[0]}" \
          ":let \$DISPLAY = \"$NEW_DISPLAY\"" Enter
        ;;
    esac
  done
