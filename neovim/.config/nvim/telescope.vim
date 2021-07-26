" =============================================================================
" telescope configuration
" =============================================================================

nnoremap <silent><leader>ff :lua require("farbodsz.telescope").find_files()<cr>
nnoremap <silent><leader><backspace> :lua require("farbodsz.telescope").find_files()<cr>

" TODO: use FZF for grepping, for now, since it is far quicker
" nnoremap <leader>F <cmd>Telescope live_grep<cr> 

nnoremap <leader>fG <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>ft <cmd>Telescope filetypes<cr>
nnoremap <leader>f? <cmd>Telescope builtin<cr>

nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>' <cmd>Telescope marks<cr>

nnoremap <leader>gc <cmd>Telescope git_branches<cr>
nnoremap <leader>gS <cmd>Telescope git_stash<cr>

nnoremap <silent><leader>sd :lua require("farbodsz.telescope").search_dotfiles()<cr>
nnoremap <silent><leader>sh :lua require("farbodsz.telescope").search_home()<cr>
