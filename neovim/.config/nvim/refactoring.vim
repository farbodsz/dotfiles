" =============================================================================
" refactoring.nvim configuration
" =============================================================================

vnoremap <leader>rr <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>

nnoremap <leader>rpp <Cmd>lua require('refactoring').debug.printf({ below = true })<CR>
vnoremap <leader>rpv <Cmd>lua require('refactoring').debug.print_var({})<CR>
nnoremap <leader>rpc <Cmd>lua require('refactoring').debug.cleanup({})<CR>
