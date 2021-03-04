" =============================================================================
" Theming 
" =============================================================================

" Set theme
colorscheme badwolf
set background=dark
set termguicolors


" Fix conceal background issue
hi Conceal ctermbg=NONE
hi Conceal ctermfg=NONE
hi Conceal guifg=NONE
hi Conceal guibg=NONE


" Badwolf theme improvements
hi DiffAdd    guifg=#aeee00 gui=inverse
hi DiffChange guifg=#8cffba gui=inverse
hi DiffDelete guifg=#ff2c4b gui=inverse
hi DiffText   guifg=#fade3e gui=bold,inverse

hi GitGutterAdd          guifg=#aeee00
hi GitGutterChange       guifg=#8cffba
hi GitGutterDelete       guifg=#ff2c4b
hi GitGutterChangeDelete guifg=#8cffba

hi SignatureMarkText   guifg=#8cffba
hi SignatureMarkerText guifg=#ff9eb8

hi ALEErrorSign   guifg=#ff2c4b
hi ALEWarningSign guifg=#fade3e
hi ALEInfoSign    guifg=#ff9eb8

" Turn on CSS properties highlighting
let g:badwolf_css_sprops_highlight = 1


" Lightline customisation
let g:lightline = {
      \ 'colorscheme': 'powerline',
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
