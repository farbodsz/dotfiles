" =============================================================================
" TeX configuration
" =============================================================================

" Default TeX format when ambiguous for VimTeX
let g:tex_flavor = 'latex'

" Concealing disabled by default but add binding to enable/disable
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
let g:tex_conceal = 'abdmg'
