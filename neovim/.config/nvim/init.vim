" ~~~~~~~
" GENERAL 
" ~~~~~~~

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
set nowrap
set autoindent
set smartindent

" Text width
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey

" Language-specific overrides for whitespace
autocmd FileType javascript,css,sass,scss,json,yaml,sh setlocal ts=2 sw=2 expandtab 

" Leader key
let mapleader = " "

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


" ~~~~~~~~~
" EXECUTION
" ~~~~~~~~~

autocmd FileType cpp setlocal makeprg=g++\ -g\ -std=c++14\ -Wall\ -o\ %< %

map <F9> <ESC>:w<CR>:make<CR>


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
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'

" Syntax highlighting improvements
Plug 'dense-analysis/ale'
Plug 'milkypostman/vim-togglelist'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neovimhaskell/haskell-vim'
Plug 'lervag/vimtex'

" Auto-completion 
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Auto-formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/vim-clang-format'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'meck/vim-brittany'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Show hex colors
Plug 'chrisbra/Colorizer'

" Previewing
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()


" ~~~~~
" THEME
" ~~~~~

source ~/.config/nvim/theme.vim


" ~~~~~~~~
" NERDTREE
" ~~~~~~~~

" Open NERDTree automatically on startup
autocmd vimenter * NERDTree

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Keybindings
nnoremap <leader>t :NERDTreeToggle<CR>


" ~~~~~~~
" FZF.VIM
" ~~~~~~~

nnoremap <silent> <leader><tab> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>' :Marks<CR>


" ~~~~~~~~~
" GITGUTTER
" ~~~~~~~~~

" Clear default mappings for GitGutter
let g:gitgutter_map_keys = 0

" Navigate git hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Preview/stage/undo hunks when cursor is in it
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)

" Toggle line highlighting
nmap <leader>hh :GitGutterLineHighlightsToggle<cr>

" Hunk text objects in visual and operator-pending modes
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)


" ~~~~~~~
" COC.VIM
" ~~~~~~~

source ~/.config/nvim/coc.vim


" ~~~
" TEX
" ~~~

" Default TeX format when ambiguous for VimTeX
let g:tex_flavor = 'latex'

" Default PDF viewer for vim-latex-live-preview
let g:livepreview_previewer = 'qpdfview'


" ~~~
" ALE
" ~~~

let g:ale_linters = {
\  'bash': ['shfmt', 'shellcheck'],
\  'python': ['pylint', 'mypy'],
\  'tex': ['chktex'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Set format for ALE messages
" In this case: [linter] some error message [E]
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>


" ~~~~~~~~~~~~~~~
" AUTO-FORMATTING
" ~~~~~~~~~~~~~~~

" Use <leader>cf for [c]ode [f]ormat 
autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<cr>
autocmd FileType javascript,typescript,json,html,css,less,scss,yaml nnoremap <buffer><leader>cf :Prettier<cr>
autocmd FileType python nnoremap <buffer><leader>cf :Isort -m 3 -tc<cr>:Black<cr>
autocmd FileType haskell nnoremap <buffer><leader>cf :Brittany<cr> 
autocmd FileType sh nnoremap <buffer><leader>cf :Shfmt<cr>

" Clang options
let g:clang_format#code_style="google"    " base style
let g:clang_format#style_options={
            \ "AllowShortCaseLabelsOnASingleLine": "true", 
            \ "IndentWidth": 4, 
            \ "AccessModifierOffset": -2, 
            \ "ContinuationIndentWidth": 8}

" Black options
let g:black_linelength=80

" Brittany options
let g:brittany_on_save = 0
let g:brittany_config_file = "~/.config/brittany/config.yaml"

" Shfmt options: like Google style guide
let g:shfmt_extra_args = "-i 2 -ci"
