" =============================================================================
" telescope configuration
" =============================================================================

nnoremap <silent><leader><backspace> :lua require("farbodsz.telescope").find_files()<cr>

" TODO: use FZF for grepping, for now, since it is far quicker
" nnoremap <leader>F <cmd>Telescope live_grep<cr> 

nnoremap <leader>fG <cmd>Telescope git_files<cr>
nnoremap <leader>fe <cmd>Telescope file_browser hidden=true<cr>
nnoremap <leader>ft <cmd>Telescope filetypes<cr>
nnoremap <leader>f: <cmd>Telescope commands<cr>
nnoremap <leader>f? <cmd>Telescope builtin<cr>

nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>' <cmd>Telescope marks<cr>

" See git.vim for git-specific mappings

nnoremap <silent><leader>sd :lua require("farbodsz.telescope").search_dotfiles()<cr>
nnoremap <silent><leader>sh :lua require("farbodsz.telescope").search_home()<cr>
