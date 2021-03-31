" =============================================================================
" vim-fugitive configuration
" =============================================================================

nmap <leader>gs :G<cr>

nmap <leader>gb :G blame<cr>
nmap <leader>gl :0Gllog<cr>

" Merging conflicts
nmap <leader>gk :diffget //2<cr>
nmap <leader>gj :diffget //3<cr>
