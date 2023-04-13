augroup ftdetect_conf
  autocmd BufNewFile,BufRead *.conf set filetype=dosini

  " Don't include .tmux.conf in this pattern
  autocmd BufNewFile,BufRead *tmux.conf set filetype=tmux
augroup end
