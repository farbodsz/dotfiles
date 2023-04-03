" =============================================================================
" refactoring.nvim configuration
" =============================================================================

nnoremap <leader>rr <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>
vnoremap <leader>rr <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>

nnoremap <leader>rpp <Cmd>lua require('refactoring').debug.printf({ below = false })<CR>
vnoremap <leader>rpv <Cmd>lua require('refactoring').debug.print_var({})<CR>
nnoremap <leader>rpd <Cmd>lua require('refactoring').debug.cleanup({})<CR>
