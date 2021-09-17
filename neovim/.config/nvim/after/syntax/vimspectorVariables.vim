" Vim syntax file
" Language:     Vimspector variables window
" Buffer name:  vimspector.Variable
" Maintainer:   Farbod Salamat-Zadeh <https://github.com/farbodsz>

if exists('b:current_syntax')
  " quit if already loaded
  finish
endif

runtime! syntax/log.vim
let b:current_syntax = 'vimspectorVariables'


syn match vimspectorVarBullet "+ "
syn match vimspectorVarBullet "- "
syn match vimspectorVarBulletExp /\s*\*\+ / 
syn match vimspectorVarBulletExp /\s*\*\- /

syn match vimspectorStScope "Scope: Locals"
syn match vimspectorStScope "Scope: Globals"

hi def link vimspectorVarBullet    Structure
hi def link vimspectorVarBulletExp Structure
hi def link vimspectorStScope      Type
