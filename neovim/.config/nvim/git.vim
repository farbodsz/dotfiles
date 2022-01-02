" =============================================================================
" Git configuration
" =============================================================================

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------

nmap <leader>gs :G<cr>

nmap <leader>gb :G blame<cr>

nmap <leader>gc :lua require("farbodsz.git").git_branches()<cr>
nmap <leader>gC :lua require("farbodsz.git").git_commits()<cr>

nmap <leader>gdb :lua require("farbodsz.git").git_compare(false)<cr>
nmap <leader>gdc :lua require("farbodsz.git").git_compare(true)<cr>

nmap <leader>ge :Gedit<cr>

nmap <leader>gl :DiffviewFileHistory<cr>
vmap <leader>gl :Gllog!<cr>
nmap <leader>gL :belowright Flogsplit<cr>

nmap <leader>gmd :GDelete<cr>
nmap <leader>gmm :GMove<space>
nmap <leader>gmr :GRename<space>

nmap <leader>gPF :G fetch --all --prune<cr>
nmap <leader>gPU :G push<cr>
nmap <leader>gPL :G pull<cr>

nmap <leader>go :GBrowse<cr>
vmap <leader>go :GBrowse<cr>
nmap <leader>gS :lua require("farbodsz.git").git_stash()<cr>

" Merging conflicts
nmap <leader>gj :diffget //2<cr>
nmap <leader>gk :diffget //3<cr>


" -----------------------------------------------------------------------------
" diffview.nvim
" -----------------------------------------------------------------------------

augroup diffview_integrations
  au!
  au FileType floggraph nmap <buffer><leader>gD :call DiffviewFlog()<cr>
  au FileType fugitive nmap <buffer><leader>gD :call DiffviewFugitiveIndex()<cr>
  au FileType fugitiveblame 
        \ nmap <buffer><leader>gD :call DiffviewFugitiveBlame()<cr>
  au FileType git nmap <buffer><leader>gD :call DiffviewFugitiveGit()<cr>

  au FileType DiffviewFileHistory nmap <buffer>a :tabclose<cr> :belowright Flogsplit -path=% -- --follow<cr>
augroup end


" Opens Diffview for the commit under the cursor in floggraph
" Floggraph format should have only the SHA in square brackets
function! DiffviewFlog()
  let l:line = trim(getline('.'))
  let l:parts = split(line, "[")
  let l:sha = split(parts[1], "]")[0]
  execute "DiffviewOpen --untracked-files=false " . l:sha . "^!"
endfunction

" Opens Diffview for the commit under the cursor in fugitiveblame
function! DiffviewFugitiveBlame()
  let l:line = trim(getline('.'))
  let l:sha = split(line, " ")[0]
  execute "DiffviewOpen --untracked-files=false " . l:sha . "^!"
endfunction

" Opens Diffview for the fugitive file showing commit details (ft=git)
" File should be in the format fugitive://<fullPath>/.git//<SHA>
function! DiffviewFugitiveGit()
  let l:sha = expand('%:t')
  let l:project_root = expand('#:h:p')  " path from previously opened file
  execute "DiffviewOpen --untracked-files=false -C" 
        \ . l:project_root . " " . l:sha . "^!"
endfunction

" Opens Diffview to compare local changes from the GStatus buffer
function! DiffviewFugitiveIndex()
  let l:project_root = expand('%:h:h')  " project root according to fugitive
  execute "DiffviewOpen --untracked-files=true -C" . l:project_root
endfunction


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

" Set lower priority than LSP signs (which are 10)
let g:gitgutter_sign_priority = 9

let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▌'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_removed_above_and_below = '▌'
let g:gitgutter_sign_modified_removed = '▌'
