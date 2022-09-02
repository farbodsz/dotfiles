" =============================================================================
" Configuration for plugins opening navigation windows
" =============================================================================

nnoremap gK :DocsViewToggle<CR>
nnoremap gO :Vista!!<CR>
nnoremap <leader>u :UndotreeToggle<CR>

augroup docs_view_window
  au!
  autocmd FileType nvim-docs-view setlocal wrap nonumber norelativenumber tw=0
augroup end

let g:vista_default_executive = 'nvim_lsp'
let g:vista_sidebar_width = 35
let g:vista_stay_on_open = 0  " don't move to vista window automatically
