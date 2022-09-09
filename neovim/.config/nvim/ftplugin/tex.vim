" =============================================================================
" TeX configuration
" =============================================================================

" Default TeX format when ambiguous for VimTeX
let g:tex_flavor = 'latex'

" Concealing disabled by default but add binding to enable/disable
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
let g:tex_conceal = 'abdmg'

" Settings for vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Disable Prettier plugin's default binding
nnoremap <leader>p <Nop>

" Using vim-latex-live-preview
augroup tex_preview
  au!
  au FileType tex nnoremap <buffer><leader>p :LLPStartPreview<cr>
augroup end
