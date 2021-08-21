" =============================================================================
" Git configuration
" =============================================================================

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------

nmap <leader>gs :G<cr>

nmap <leader>gb :G blame<cr>

nmap <leader>gc <cmd>Telescope git_branches<cr>
nmap <leader>gC :lua require("farbodsz.git").git_commits()<cr>

nmap <leader>gD :Gdiffsplit!<space>
nmap <leader>gdb :lua require("farbodsz.git").git_compare(false)<cr>
nmap <leader>gdc :lua require("farbodsz.git").git_compare(true)<cr>

nmap <leader>gl :0Gllog!<cr>
vmap <leader>gl :Gllog!<cr>
nmap <leader>gL :Gclog!<cr>

nmap <leader>gmd :GDelete<cr>
nmap <leader>gmm :GMove<space>
nmap <leader>gmr :GRename<space>

nmap <leader>go :GBrowse<cr>
vmap <leader>go :GBrowse<cr>
nmap <leader>gS <cmd>Telescope git_stash<cr>

" Merging conflicts
nmap <leader>gk :diffget //2<cr>
nmap <leader>gj :diffget //3<cr>


" -----------------------------------------------------------------------------
" vim-rhubarb
" -----------------------------------------------------------------------------

" No preview window for issue body
set completeopt-=preview

" Show issue/PR completion after '#' pressed in insert mode
" Note: ~/.netrc file must be present for auth to work
function! OpenCompletion()
    if !pumvisible() && (v:char ==? '#')
        call feedkeys("\<C-x>\<C-o>", 'n')
    endif
endfunction

augroup autocomplete_issues
  au!
  autocmd FileType gitcommit
        \ autocmd! InsertCharPre <buffer> call OpenCompletion()
augroup end


" -----------------------------------------------------------------------------
" gitgutter
" -----------------------------------------------------------------------------

" Clear default mappings for GitGutter
let g:gitgutter_map_keys = 0

" Navigate git hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Preview/stage/undo hunks when cursor is in it
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)

" Toggle line highlighting
nmap <leader>hh :GitGutterLineHighlightsToggle<cr>

" Hunk text objects in visual and operator-pending modes
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▌'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_removed_above_and_below = '▌'
let g:gitgutter_sign_modified_removed = '▌'
