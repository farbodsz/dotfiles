" Vim syntax file
" Language:     Clang Format
" Filenames:    *.clang-format
" Maintainer:   Farbod Salamat-Zadeh <https://github.com/farbodsz>

if exists('b:current_syntax')
  " quit if already loaded
  finish
endif

runtime! syntax/yaml.vim
let b:current_syntax = 'clang-formatk'
