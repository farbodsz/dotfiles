" =============================================================================
" Auto-formatting configuration
" =============================================================================

" Use <leader>cf for [c]ode [f]ormat
augroup autoformat_settings
  au!
  " Language-specific
  autocmd FileType html,css,scss nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType javascript nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType json,yaml nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType markdown nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType typescript nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType typescriptreact nnoremap <buffer><leader>cf :Prettier<cr>
augroup end

" Prettier
let g:prettier#config#prose_wrap = 'always'
