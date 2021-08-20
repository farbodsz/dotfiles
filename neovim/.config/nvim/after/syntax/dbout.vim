" Vim syntax file
" Language:     Database output
" Filenames:    *.dbout
" Maintainer:   Farbod Salamat-Zadeh <https://github.com/farbodsz>

if exists('b:current_syntax')
  " quit if already loaded
  finish
endif

runtime! syntax/log.vim
let b:current_syntax = "dbout"

syn match dboutBorder "|"
syn match dboutBorder /+---\+/

hi def link dboutBorder logBrackets

syn match dboutRecordBorder "-\["
syn match dboutRecordBorder "-\]"
syn match dboutRecord "RECORD"

hi def link dboutRecordBorder logBrackets
