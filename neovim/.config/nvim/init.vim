" =============================================================================
" NeoVim configuration
" Author: Farbod Salamat-Zadeh
" =============================================================================

" Syntax
syntax on

" Encoding
set encoding=utf-8

" Whitespace and indentation
set expandtab
set textwidth=80
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

" Wrapping and column width
set nowrap
autocmd FileType qf setlocal wrap
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey

" Folding
set foldmethod=manual
set nofoldenable
set foldopen-=block  " prevent block movements from opening folds

augroup remember_folds
  autocmd!
  au BufWrite,VimLeave ?* silent! mkview
  au BufRead ?* silent! loadview
augroup end

" Language-specific overrides for whitespace (tabstop and shiftwidth)
augroup whitespace_settings
  autocmd FileType bib setlocal sw=2 ts=2
  autocmd FileType html,css,sass,scss setlocal sw=2 ts=2
  autocmd FileType javascript setlocal sw=2 ts=2
  autocmd FileType json,yaml setlocal sw=2 ts=2
  autocmd FileType markdown setlocal sw=2 ts=2
  autocmd FileType sh setlocal sw=2 ts=2
  autocmd FileType vim setlocal sw=2 ts=2
augroup end

" Spelling
augroup spelling_settings
  autocmd FileType markdown,tex setlocal spell
  " Go to end of word, then show spelling fix suggestions in insert mode
  autocmd FileType markdown,tex nnoremap <buffer><leader>s ea<C-x><C-s>
augroup end

" Leader key
let mapleader = ' '

" Show sign columns
set signcolumn=yes

" Stop newline continuation of comments
set formatoptions-=cro

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/ = ''<cr>

" Show relative line numbers
set number
set relativenumber

" Show file stats
set ruler

" Vim auto-indents when pasting, set a toggle for this
set pastetoggle=<F3>

" Automatically use system clipboard for copy/paste
set clipboard=unnamedplus

" Give more space for displaying messages
set cmdheight=2

" Enable mouse
set mouse=a

" Auto source init.vim on save
au! BufWritePost $MYVIMRC source %


" ~~~~~~~~
" MAPPINGS
" ~~~~~~~~

" Save
nnoremap <leader>w :w<CR>

" Yank file contents
nnoremap <leader>y :%y<CR>

" Window navigation and resizing
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Open this init.vim
nnoremap <C-M-s> :e ~/.config/nvim/init.vim<CR>


" ~~~~~~~~~~~
" PRE-PLUGINS
" ~~~~~~~~~~~

" Disable LSP features in ALE since already provided by COC
" This needs to be before plugins are loaded.
let g:ale_disable_lsp = 1

" ~~~~~~~
" PLUGINS
" ~~~~~~~

call plug#begin()

" Theming and styling
Plug 'sjl/badwolf', { 'as': 'badwolf' }
Plug 'itchyny/lightline.vim'

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'milkypostman/vim-togglelist'

" Syntax highlighting improvements
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'gisphm/vim-gitignore', { 'for': 'gitignore' }
Plug 'adimit/prolog.vim', { 'for': 'prolog' }

" Auto-completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Auto-formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/vim-clang-format'
Plug 'psf/black', { 'for': 'python', 'branch': 'stable' }
Plug 'stsewd/isort.nvim', { 'for': 'python', 'do': ':UpdateRemotePlugins' }
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Show hex colors
Plug 'chrisbra/Colorizer'

" Previewing
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & yarn install'  }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()


" ~~~~~~~~~~~~~
" PLUGIN CONFIG
" ~~~~~~~~~~~~~

source ~/.config/nvim/theme.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/gitgutter.vim

nmap <script> <silent> <leader>l :call ToggleLocationList()<cr>


" ~~~~~~
" SYNTAX
" ~~~~~~

" i3config detection based on filepath
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.dotfiles/i3/.config/i3/config set filetype=i3config
aug end

" Do not automatically insert bulletpoints with vim-markdown
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0


" ~~~~~~~~~~~~~~
" MARKDOWN & TEX
" ~~~~~~~~~~~~~~

" Default TeX format when ambiguous for VimTeX
let g:tex_flavor = 'latex'

" Concealing disabled by default but add binding to enable/disable
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
let g:tex_conceal = 'abdmg'

" Highlight math regions within markdown
let g:vim_markdown_math = 1

" Fix conceal background issue
hi Conceal ctermbg=NONE
hi Conceal ctermfg=NONE
hi Conceal guifg=NONE
hi Conceal guibg=NONE

" Settings for vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Keybinding to preview files and disable Prettier plugin's default binding
nnoremap <leader>p <Nop>
augroup file_preview
  autocmd FileType markdown nnoremap <buffer><leader>p :MarkdownPreview<cr>
  autocmd FileType tex      nnoremap <buffer><leader>p :LLPStartPreview<cr>
augroup end


" ~~~~~~~~~~~~~~~
" AUTO-FORMATTING
" ~~~~~~~~~~~~~~~

" Use <leader>cf for [c]ode [f]ormat
augroup autoformat_settings
  " Language-specific
  autocmd FileType c,cpp nnoremap <buffer><leader>cf :ClangFormat<cr>
  autocmd FileType c,cpp vnoremap <buffer><leader>cf :ClangFormat<cr>
  autocmd FileType haskell nnoremap <buffer><leader>cf :ALEFix<cr>
  autocmd FileType html,css,scss nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType javascript nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType json,yaml nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType markdown nnoremap <buffer><leader>cf :Prettier<cr>
  autocmd FileType python nnoremap <buffer><leader>cf :Isort -m 3 -tc<cr>:Black<cr>
  autocmd FileType sh nnoremap <buffer><leader>cf :Shfmt<cr>
  " Default
  nnoremap <buffer><leader>cf :ALEFix<cr>
augroup end

" Prettier
let g:prettier#config#prose_wrap = 'always'

" Black options
let g:black_linelength = 80

" Shfmt options: like Google style guide
let g:shfmt_extra_args = '-i 2 -ci'
