" =============================================================================
" vim-fugitive and vim-rhubarb configuration
" =============================================================================

" Mappings
" (See telescope.vim for more git-related mappings)

nmap <leader>gs :G<cr>

nmap <leader>gb :G blame<cr>
nmap <leader>gl :0Gclog!<cr>
nmap <leader>gL :Gclog!<cr>
nmap <leader>go :GBrowse<cr>

" Merging conflicts
nmap <leader>gk :diffget //2<cr>
nmap <leader>gj :diffget //3<cr>

" vim-rhubarb: no preview window for issue body
set completeopt-=preview

" Show issue/PR completion after '#' pressed in insert mode
" Note: ~/.netrc file must be present for auth to work
function! OpenCompletion()
    if !pumvisible() && (v:char ==? '#')
        call feedkeys("\<C-x>\<C-o>", 'n')
    endif
endfunction

augroup autocomplete_issues
  au!
  autocmd FileType gitcommit
        \ autocmd! InsertCharPre <buffer> call OpenCompletion()
augroup end
