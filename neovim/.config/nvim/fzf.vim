" =============================================================================
" FZF configuration
" =============================================================================

" Specify arguments for Rg (default command in FZF is files)
let s:fzf_command_files = 
      \ 'rg --files --hidden -g "!{.git,.cache,node_modules}"'
let s:fzf_command_search = 
      \ 'rg --column --no-heading --line-number --color=always '
let $FZF_DEFAULT_COMMAND = s:fzf_command_files

" Override default FZF vim commands
let s:fzf_options={'options':
      \   ['--layout=reverse', '--info=inline']
      \ }
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(
      \   <q-args>,
      \   fzf#vim#with_preview(s:fzf_options),
      \   <bang>0
      \ )
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   s:fzf_command_search.shellescape(<q-args>),
      \   1,                                                                                                              
      \   fzf#vim#with_preview(s:fzf_options),                                                                                         
      \   <bang>0
      \ )

" Set layout options for fzf.vim
let g:fzf_layout = {
      \ 'up': '~90%',
      \ 'window': {
      \     'width': 0.9,
      \     'height': 0.9,
      \     }
      \ }

" Bindings: most common
nnoremap <silent> <leader><tab> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>' :Marks<CR>

" Bindings: s for search
nnoremap <silent> <leader>sb :Buffers<CR>
nnoremap <silent> <leader>sd :Files ~/.dotfiles<CR>
nnoremap <silent> <leader>sh :Files ~<CR>
