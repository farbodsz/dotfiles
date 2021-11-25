" Vim syntax file
" Language:   BNF
" Filenames:  *.bnf
" Maintainer: Farbod Salamat-Zadeh <https://github.com/farbodsz>

if exists('b:current_syntax')
  " quit if already loaded
  finish
endif

syn match bnfOr         "|"
syn match bnfRule       "::="

syn match bnfIdentifier /\v[A-Za-z_]+/
syn match bnfConst      /\v[A-Z_]+/
syn match bnfComment    "#.*$"

syn match bnfSpecial    "epsilon"

syn region bnfString    start=/"/ skip=/\\./ end=/"/

hi link bnfRule         Keyword
hi link bnfOr           Keyword
hi link bnfIdentifier   Identifier
hi link bnfConst        Constant
hi link bnfSpecial      Special
hi link bnfString       String
hi link bnfComment      Comment

let b:current_syntax = 'bnf'
