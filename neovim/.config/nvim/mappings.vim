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


" Tab navigation (override unimpaired.vim tag maps)
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [T :tabclose<CR>
nnoremap ]T :tabnew<CR>


" Open scratch buffer (note <C-w>n opens a normal new window/buffer)
nnoremap <C-n> :call OpenScratch()<CR>

function! OpenScratch()
  new
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfunction


" Terminal mode mappings
augroup terminal_escape
  " Use Esc to go to normal mode in terminal, *except* for FZF buffer
  au! TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
augroup end


" Esc
inoremap <C-c> <Esc><Esc>


" Quickfix and location list
nmap <script> <silent> <leader>l :call ToggleLocationList()<cr>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<cr>


" Unimpaired
source ~/.config/nvim/unimpaired.vim


" Code format: remove trailing whitespace and blank lines
" TODO: Use this as a 'backup' option for my cf mapping?
nnoremap <silent><leader>cF :%s/\s\+$//e<CR>:%s#\($\n\s*\)\+\%$##e<CR>
