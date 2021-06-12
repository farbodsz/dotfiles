" =============================================================================
" Theming 
" =============================================================================

" Set theme
set background=dark
set termguicolors

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_colors = { 'bg0': '1c1b1a' } " darker bg from badwolf
let g:gruvbox_sign_column = 'bg0'

colorscheme gruvbox


" Lightline customisation
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], 
      \              [ 'percent' ], 
      \              [ 'gitstatus', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gitstatus': 'GitStatus',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" Use autocmd to force lightline update for Coc
autocmd User CocStatusChange, CocDiagnosticChange call lightline#update()


" GitGutter summary
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction


" Colorizer
let g:colorizer_skip_comments = 1
let g:colorizer_colornames = 0


" Explorer
let g:coc_explorer_global_presets = {
      \ 'custom': {
      \   'width': 30,
      \ },
      \ }

nnoremap <leader>t :CocCommand explorer --preset custom<CR>
