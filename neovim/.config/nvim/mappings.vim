"==============================================================================
" Keybindings for default vim commands
"==============================================================================

" Save
nnoremap <leader>w :w<CR>

" Yank file contents
nnoremap <leader>y :%y<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Terminal mode mappings
aug terminal_escape
  " Use Esc to go to normal mode in terminal, *except* for FZF buffer
  au!
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
aug end
