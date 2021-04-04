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
set autoindent
set smartindent

set shiftwidth=2
set tabstop=2
set softtabstop=2

" Language-specific overrides for whitespace (tabstop and shiftwidth)
augroup whitespace_settings
  autocmd FileType c,cpp setlocal sw=4 ts=4
  autocmd FileType haskell setlocal sw=4 ts=4
  autocmd FileType python setlocal sw=4 ts=4
augroup end

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

aug terminal_escape
  " Use Esc to go to normal mode in terminal, *except* for FZF buffer
  au!
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
aug end


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
Plug 'adimit/prolog.vim', { 'for': 'prolog' }
Plug '~/dot-syntax.vim', { 'for': 'dot' }
Plug '~/gitignore.vim', { 'for': 'gitignore' }
Plug 'MTDL9/vim-log-highlighting'

" Auto-completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'

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
Plug 'liuchengxu/graphviz.vim', { 'for': 'dot' }

call plug#end()


" ~~~~~~~~~~~~~
" PLUGIN CONFIG
" ~~~~~~~~~~~~~

source ~/.config/nvim/theme.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/fugitive.vim
source ~/.config/nvim/gitgutter.vim

nmap <script> <silent> <leader>l :call ToggleLocationList()<cr>

let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsEditSplit="vertical"


" ~~~~~~
" SYNTAX
" ~~~~~~

" i3config detection based on filepath
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.dotfiles/i3/.config/i3/config set filetype=i3config
aug end

" Use YAML syntax for .clang-format files
aug clang_config_syntax
  au!
  au BufNewFile,BufRead *.clang-format set syntax=yaml
aug end

" Try improving rendering times on large files
set re=1


" ~~~~~~~~~~~~~~
" MARKDOWN & TEX
" ~~~~~~~~~~~~~~

" Default TeX format when ambiguous for VimTeX
let g:tex_flavor = 'latex'

" Concealing disabled by default but add binding to enable/disable
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
let g:tex_conceal = 'abdmg'

" Markdown settings
let g:vim_markdown_math = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_fenced_languages = ['graphviz=dot']
let g:vim_markdown_frontmatter = 1

" Use gO (goto outline) - same binding as for vim docs
autocmd FileType markdown nnoremap <buffer>gO :Toch<cr>

" Settings for vim-latex-live-preview
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Settings for GraphViz
let g:graphviz_output_format = 'png'

" Disable Prettier plugin's default binding
nnoremap <leader>p <Nop>

augroup file_preview
  autocmd Filetype dot nnoremap <buffer><leader>p :Graphviz!!<cr>

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
