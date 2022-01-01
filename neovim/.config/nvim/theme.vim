" =============================================================================
" Theming
" =============================================================================

" Set theme
set background=dark
set termguicolors

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_colors = { 'bg0': '1c1b1a' } " darker bg from badwolf
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_invert_selection = 0

colorscheme gruvbox

function ApplyThemeTweaks()
  hi link TSOperator     GruvboxRed
  hi link TSPunctBracket Comment
  hi link TSTagDelimiter Comment
endfunction

augroup theme_tweaks
  au!
  au ColorScheme,VimEnter * call ApplyThemeTweaks()
augroup end


" LSP signs
sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=


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
      \   'gitstatus': 'GitStatus'
      \ },
      \ }


" GitGutter summary
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction


" Explorer
lua require("farbodsz.filetree")
nnoremap <leader>t :NvimTreeToggle<CR>
