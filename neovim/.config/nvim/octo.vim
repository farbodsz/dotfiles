" =============================================================================
" Octo.nvim configuration
" =============================================================================

" NOTE: Keybindings from Lua config apply to Octo filetype

lua require("farbodsz.octo").setup()

" Keybindings below are global

nnoremap <leader>G<space> :Octo<space>

nnoremap <leader>Gi<space> :Octo issue<space>
nnoremap <leader>Gil :Octo issue list<Cr>
nnoremap <leader>Gic :Octo issue create<CR>

nnoremap <leader>Gp<space> :Octo pr<space>
nnoremap <leader>Gpl :Octo pr list<CR>
nnoremap <leader>Gpc :Octo pr create<CR>
