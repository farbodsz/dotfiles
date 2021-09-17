" Vim syntax file
" Language:     Vimspector stack trace window
" Buffer name:  vimspector.StackTrace
" Maintainer:   Farbod Salamat-Zadeh <https://github.com/farbodsz>

if exists('b:current_syntax')
  " quit if already loaded
  finish
endif

runtime! syntax/log.vim
let b:current_syntax = 'vimspectorStackTrace'


syn match vimspectorStBullet "+ "
syn match vimspectorStBullet "- "

syn match vimspectorStThread  /Thread \d\+/
syn match vimspectorStService "SERVICE"

syn match vimspectorStStatus "(running)"
syn match vimspectorStStatus "(paused)"
syn match vimspectorStStatus "(stopped)"

syn match vimspectorStAt "@"

hi def link vimspectorStBullet  Structure
hi def link vimspectorStThread  Type
hi def link vimspectorStService Keyword
hi def link vimspectorStStatus  Identifier
hi def link vimspectorStAt      Character
