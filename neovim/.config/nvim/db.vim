" =============================================================================
" Database plugin configurations
" =============================================================================

" pgsql.vim (syntax)

let g:sql_type_default = 'pgsql'


" vim-dadbod-ui

let g:db_ui_execute_on_save = 0
let g:db_ui_auto_execute_table_helpers = 0

let g:db_ui_show_help = 0
let g:db_ui_force_echo_notifications = 1
let g:db_ui_disable_mappings = 1

nnoremap <leader>dt :DBUIToggle<cr>
nnoremap <leader>df :DBUIFindBuffer<cr>
nnoremap <leader>dr :DBUIRenameBuffer<cr>
nnoremap <leader>dl :DBUILastQueryInfo<cr>

augroup dbui_mappings
  au!
  autocmd FileType dbui nmap <buffer><return> <Plug>(DBUI_SelectLine)
  autocmd FileType dbui nmap <buffer>o <Plug>(DBUI_SelectLine)
  autocmd FileType dbui nmap <buffer>d <Plug>(DBUI_DeleteLine)
  autocmd FileType dbui nmap <buffer>R <Plug>(DBUI_Redraw)
  autocmd FileType dbui nmap <buffer>A <Plug>(DBUI_AddConnection)
  autocmd FileType dbui nmap <buffer>H <Plug>(DBUI_ToggleDetails)
  autocmd FileType dbui nmap <buffer><leader>r <Plug>(DBUI_RenameLine)
  autocmd FileType dbui nmap <buffer>q <Plug>(DBUI_Quit)

  autocmd FileType dbui nmap <buffer>[[ <Plug>(DBUI_GotoPrevSibling)
  autocmd FileType dbui nmap <buffer>]] <Plug>(DBUI_GotoNextSibling)

  autocmd FileType dbout nmap <buffer>gk <Plug>(DBUI_JumpToForeignKey)
  autocmd FileType dbout nmap <buffer>p <Plug>(DBUI_ToggleResultLayout)

  autocmd FileType sql nmap <buffer><leader>dx <Plug>(DBUI_ExecuteQuery)
  autocmd FileType sql nmap <buffer><leader>de <Plug>(DBUI_EditBindParameters)
augroup end

augroup dbout_settings
  au!
  autocmd FileType dbout setlocal colorcolumn=
  autocmd FileType dbout setlocal signcolumn=
augroup end
