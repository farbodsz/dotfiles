" =============================================================================
" neoterm configuration
" =============================================================================

let g:neoterm_default_mod = 'botright'
let g:neoterm_size = 15
let g:neoterm_autoscroll = 1

nnoremap <C-t> :Ttoggle<CR>
tnoremap <C-t> <C-\><C-n>

" Starts a REPL in Neoterm using the given terminal number.
function! StartRepl(termno)
  execute 'Topen ' . a:termno
  execute 'TREPLSetTerm ' . a:termno
endfunction

command! -nargs=0 REPL :call StartRepl(1)<CR>
