" =============================================================================
" telescope configuration
" =============================================================================

lua require("farbodsz.telescope")

nnoremap <silent><leader><backspace> :lua require("farbodsz.telescope").find_files()<cr>
nnoremap <silent><leader>F :lua require("farbodsz.telescope").live_grep()<cr>

nnoremap <leader>fG <cmd>Telescope git_files<cr>
nnoremap <leader>fe <cmd>Telescope file_browser hidden=true<cr>
nnoremap <leader>ft <cmd>Telescope filetypes<cr>
nnoremap <leader>f: <cmd>Telescope commands<cr>
nnoremap <leader>f? <cmd>Telescope builtin<cr>

nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>' <cmd>Telescope marks<cr>

nnoremap <silent><leader>sd :lua require("farbodsz.telescope").search_dotfiles()<cr>
nnoremap <silent><leader>sh :lua require("farbodsz.telescope").search_home()<cr>
