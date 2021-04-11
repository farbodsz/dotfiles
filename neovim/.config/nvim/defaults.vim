" =============================================================================
" Standard configuration for non-plugin commands
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
  autocmd FileType make setlocal noexpandtab
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
au! BufWritePost init.vim source %

" Allow external project-specific vimrc
set exrc
