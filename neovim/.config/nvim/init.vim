" =============================================================================
" NeoVim configuration
" Author: Farbod Salamat-Zadeh
" =============================================================================

" Load default mappings and keybindings
source ~/.config/nvim/defaults.vim
source ~/.config/nvim/mappings.vim


" PREPLUGIN:
" Disable LSP features in ALE since already provided by COC
" This needs to be before plugins are loaded.
let g:ale_disable_lsp = 1


" PLUGINS:

call plug#begin()

" Theming and styling
Plug 'sjl/badwolf', { 'as': 'badwolf' }
Plug 'itchyny/lightline.vim'

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'milkypostman/vim-togglelist'

" Language support
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Auto-completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

" Syntax highlighting
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }
Plug 'adimit/prolog.vim', { 'for': 'prolog' }
Plug 'MTDL9/vim-log-highlighting'

" Auto-formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/vim-clang-format'
Plug 'psf/black', { 'for': 'python', 'branch': 'stable' }
Plug 'stsewd/isort.nvim', { 'for': 'python', 'do': ':UpdateRemotePlugins' }
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Show hex colors
Plug 'chrisbra/Colorizer'

" Previewing
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & yarn install'  }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()


" CONFIG:

source ~/.config/nvim/theme.vim

source ~/.config/nvim/coc.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/format.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/fugitive.vim
source ~/.config/nvim/gitgutter.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/syntax.vim
source ~/.config/nvim/tex.vim


" MISCELLANY:

nmap <script> <silent> <leader>l :call ToggleLocationList()<cr>

let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsEditSplit="vertical"


" PREVIEWING:

" Settings for vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Disable Prettier plugin's default binding
nnoremap <leader>p <Nop>

augroup file_preview
  " m for 'make'
  " Convert to HTML using pandoc, open in chrome, then focus back on terminal
  autocmd FileType markdown nnoremap <buffer><leader>m
              \ :! ~/bin/mdpreview.sh % preview.html &&
              \ google-chrome preview.html &&
              \ xdotool search --onlyvisible --class Kitty windowfocus<cr>

  " p for 'preview'
  " Silently convert to HTML, refresh tab, then focus back on terminal
  autocmd FileType markdown nnoremap <buffer><silent><leader>p :silent exec
              \ "! ~/bin/mdpreview.sh % preview.html &&
              \ xdotool search --onlyvisible --class Chrome windowfocus key F5 &&
              \ xdotool search --onlyvisible --class Kitty windowfocus"<cr>

  " p for 'preview'
  " Using vim-latex-live-preview
  autocmd FileType tex nnoremap <buffer><leader>p :LLPStartPreview<cr>
augroup end
