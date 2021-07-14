" =============================================================================
" telescope configuration
" =============================================================================

nnoremap <leader>ff <cmd>Telescope find_files<cr>
" TODO: use FZF for grepping, for now, since it is far quicker
" nnoremap <leader>fg <cmd>Telescope live_grep<cr> 
nnoremap <leader>' <cmd>Telescope marks<cr>
nnoremap <leader>f? <cmd>Telescope builtin<cr>

nnoremap <leader>gc <cmd>Telescope git_branches<cr>
nnoremap <leader>gS <cmd>Telescope git_stash<cr>

lua require("farbodsz.telescope")
nnoremap <leader>sd :lua require("farbodsz.telescope").search_dotfiles()<cr>
