" =============================================================================
" ALE configuration
" =============================================================================

let g:ale_linters = {
      \ 'bash': ['shfmt', 'shellcheck'],
      \ 'python': ['pylint', 'mypy'],
      \ 'tex': ['chktex'],
      \ }

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Set format for ALE messages
" In this case: [linter] some error message [E]
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_fixers = {
      \ 'bib': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'haskell': ['brittany'],
      \ 'tex': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'vim': ['remove_trailing_lines', 'trim_whitespace'],
      \ }