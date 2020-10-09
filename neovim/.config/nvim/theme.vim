" =============================================================================
" Theming 
" =============================================================================

" Set theme
colorscheme badwolf
set background=dark
set termguicolors

" Badwolf theme customisation
" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1

" Lightline customisation
" Removed: fileencoding, fileformat
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
