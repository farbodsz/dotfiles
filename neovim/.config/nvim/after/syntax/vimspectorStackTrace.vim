" Vim syntax file
" Language:     Vimspector stack trace
" Buffer name:  vimspector.StackTrace
" Maintainer:   Farbod Salamat-Zadeh <https://github.com/farbodsz>

if exists('b:current_syntax')
  " quit if already loaded
  finish
endif

runtime! syntax/log.vim
let b:current_syntax = 'vimspectorStackTrace'

syn match vimspectorStStatus "(running)"
syn match vimspectorStStatus "(paused)"
syn match vimspectorStStatus "(stopped)"

syn match vimspectorStService "SERVICE"

hi def link vimspectorStStatus  Boolean
hi def link vimspectorStService Keyword
