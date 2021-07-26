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

function! s:find_project_root()
  return finddir('.git/..', expand('%:p:h').';')
endfunction
command! ProjectFiles execute 'Files' s:find_project_root()

" Set layout options for fzf.vim
let g:fzf_layout = {
      \ 'up': '~90%',
      \ 'window': {
      \     'width': 0.9,
      \     'height': 0.9,
      \     }
      \ }

" Bindings: most common
nnoremap <silent> <leader>F :Rg<CR>

" Actions
function! s:build_quickfix_list(lines)
  call setqflist([], ' ', {
        \ 'title': 'fzf',
        \ 'items': map(copy(a:lines),
        \ '{ "filename": v:val }')
        \ })
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
