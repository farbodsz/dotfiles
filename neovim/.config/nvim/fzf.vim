" =============================================================================
" FZF configuration
" =============================================================================

nnoremap <silent> <leader><tab> :GFiles<CR>
nnoremap <silent> <leader><S-tab> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>' :Marks<CR>

let g:fzf_layout = {
      \ 'up': '~90%', 
      \ 'window': { 
      \     'width': 0.9, 
      \     'height': 0.9, 
      \     } 
      \ }
