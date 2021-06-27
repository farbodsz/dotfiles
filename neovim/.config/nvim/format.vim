" =============================================================================
" Auto-formatting configuration
" =============================================================================

" Use <leader>cf for [c]ode [f]ormat
augroup autoformat_settings
  au!
  " Language-specific
  autocmd FileType c,cpp nnoremap <buffer><leader>cf :ClangFormat<cr>
  autocmd FileType c,cpp vnoremap <buffer><leader>cf :ClangFormat<cr>
  autocmd FileType haskell nnoremap <buffer><leader>cf :ALEFix<cr>
  autocmd FileType html,css,scss nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType javascript nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType json,yaml nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType markdown nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType python nnoremap <buffer><leader>cf :Isort -m 3 -tc<cr>:Black<cr>
  autocmd FileType sh nnoremap <buffer><leader>cf :Shfmt<cr>
  autocmd FileType typescript nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType typescriptreact nnoremap <buffer><leader>cf :Prettier<cr>
  " Default
  nnoremap <buffer><leader>cf :ALEFix<cr>
augroup end

" ClangFormat defaults
let g:clang_format#code_style = 'google'
let g:clang_format#style_options = { 'AccessModifierOffset': -2 }

" Prettier
let g:prettier#config#prose_wrap = 'always'

" Black options
let g:black_linelength = 80

" Shfmt options: like Google style guide
let g:shfmt_extra_args = '-i 2 -ci'
