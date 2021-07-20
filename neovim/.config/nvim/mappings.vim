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

nnoremap <M-J> :resize -20<CR>
nnoremap <M-K> :resize +20<CR>
nnoremap <M-H> :vertical resize -20<CR>
nnoremap <M-L> :vertical resize +20<CR>

" Vim maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <C-w>m :MaximizerToggle!<CR>

" Open scratch buffer (note <C-w>n opens a normal new window/buffer)
nnoremap <C-n> :call OpenScratch()<CR>

function! OpenScratch()
  new
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfunction


" Terminal mode mappings
aug terminal_escape
  " Use Esc to go to normal mode in terminal, *except* for FZF buffer
  au!
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
aug end


" Quickfix and location list
nmap <script> <silent> <leader>l :call ToggleLocationList()<cr>
nmap <script> <silent> <leader>qq :call ToggleQuickfixList()<cr>
