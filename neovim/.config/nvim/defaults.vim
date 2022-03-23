" =============================================================================
" Standard configuration for non-plugin commands
" =============================================================================

" Syntax
syntax on

set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Encoding
set encoding=utf-8

" Whitespace and indentation
set expandtab
set autoindent
set smartindent

set shiftwidth=2
set tabstop=2
set softtabstop=2

set list
set listchars=tab:>\ ,nbsp:+

" Language-specific overrides for whitespace (tabstop and shiftwidth)
augroup whitespace_settings
  au!
  autocmd FileType haskell setlocal sw=4 ts=4
  autocmd FileType python setlocal sw=4 ts=4
  autocmd FileType make setlocal noexpandtab
augroup end

" Wrapping and column width
set nowrap
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey

augroup wrapping
  au!
  autocmd FileType ale-preview setlocal wrap
  autocmd FileType qf setlocal wrap
  autocmd FileType java setlocal tw=100 cc=100
augroup end

" Scrolling: keep 4 lines above and below cursor
set scrolloff=4

" Folding
set foldmethod=manual
set foldopen-=block  " prevent block movements from opening folds

" Spelling
augroup spelling_settings
  autocmd FileType gitcommit,mail,markdown,tex setlocal spell
  " Go to end of word, then show spelling fix suggestions in insert mode
  autocmd FileType gitcommit,mail,markdown,tex nnoremap <buffer><leader>s ea<C-x><C-s>
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
set inccommand=nosplit
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/ = ''<cr>

" Highlight yanks
au TextYankPost * silent! lua vim.highlight.on_yank{ higroup="Visual", timeout=100 }

" Diffs 
set diffopt=internal,filler,algorithm:histogram,indent-heuristic,closeoff,context:10

" Show relative line numbers and file stats
set number
set relativenumber
set ruler

" Prevent windows auto-resizing when one is closed/opened
set noequalalways

" Vim auto-indents when pasting, set a toggle for this
set pastetoggle=<F3>

" Automatically use system clipboard for copy/paste
set clipboard=unnamedplus

" Give more space for displaying messages
set cmdheight=2

" Enable mouse
set mouse=a

" Allow external project-specific vimrc
set exrc
