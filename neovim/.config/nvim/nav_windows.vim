" =============================================================================
" Configuration for plugins opening navigation windows
" =============================================================================

nnoremap gK :DocsViewToggle<CR>
nnoremap gO :SymbolsOutline<CR>
nnoremap <leader>u :UndotreeToggle<CR>

augroup docs_view_window
  au!
  autocmd FileType nvim-docs-view setlocal wrap nonumber norelativenumber tw=0
augroup end

:lua require("farbodsz.lsp.outline").setup()
