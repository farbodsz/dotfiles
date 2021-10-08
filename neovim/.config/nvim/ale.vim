" =============================================================================
" ALE configuration
" =============================================================================

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Disable auto-detection of virtual envs, use $VIRTUAL_ENV instead
let g:ale_virtualenv_dir_names = []

" Set format for ALE messages
" In this case: [linter] some error message [E]
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
      \ 'lua': ['luacheck',],
      \ 'prolog': ['swipl'],
      \ 'python': ['pylint', 'mypy'],
      \ 'sh': ['shellcheck'],
      \ 'tex': ['chktex'],
      \ 'vim': ['vimls', 'vint'],
      \ }

" Mapping to see error detail window
nnoremap <leader>ed :ALEDetail<cr>
