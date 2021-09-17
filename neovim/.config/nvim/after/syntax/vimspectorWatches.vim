" Vim syntax file
" Language:     Vimspector watches window
" Buffer name:  vimspector.Watches
" Maintainer:   Farbod Salamat-Zadeh <https://github.com/farbodsz>

if exists('b:current_syntax')
  " quit if already loaded
  finish
endif

runtime! syntax/vimspectorVariables.vim
let b:current_syntax = ''


syn match vimspectorWatchesType "Watches"
syn match vimspectorWatchesType "Expression"

hi def link vimspectorWatchesType Type
