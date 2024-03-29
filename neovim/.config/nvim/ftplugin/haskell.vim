" =============================================================================
" Haskell config
" =============================================================================

" Opens a web browser with the Hoogle search result
function! s:SearchHoogle(query)
  let l:base_url = 'https://hoogle.haskell.org/?hoogle='
  silent exec '!google-chrome '.shellescape(l:base_url).shellescape(a:query)
endfunction

command! -nargs=1 Hoogle call s:SearchHoogle(<f-args>)

nnoremap <leader>Hh :Hoogle<space>
nnoremap <leader>Hp :Pointfree<CR>
vnoremap <leader>Hp :PointfreeSelection<CR>
