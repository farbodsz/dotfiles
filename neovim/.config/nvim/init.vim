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

call plug#begin('~/.config/nvim/plugged')

" Theming and styling
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" Navigation: FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigation: Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Navigation: Others
Plug 'kassio/neoterm'
Plug 'kshenoy/vim-signature'
Plug 'milkypostman/vim-togglelist'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-unimpaired'
Plug 'liuchengxu/vista.vim'

" Language support
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Auto-completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rafcamlet/coc-nvim-lua'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

" Language syntax/detection
Plug 'memgraph/cypher.vim', { 'for': 'cypher' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'towolf/vim-helm', { 'for': ['helm', 'yaml'] }
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'lifepillar/pgsql.vim'
Plug 'adimit/prolog.vim', { 'for': 'prolog' }
Plug 'MTDL9/vim-log-highlighting', { 'for': 'log' }

" Auto-formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'psf/black', { 'for': 'python', 'branch': 'stable' }
Plug 'stsewd/isort.nvim', { 'for': 'python', 'do': ':UpdateRemotePlugins' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sindrets/diffview.nvim'
Plug 'rbong/vim-flog'
Plug 'tommcdo/vim-fugitive-blame-ext'

" Databases
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'jbyuki/one-small-step-for-vimkind'

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
source ~/.config/nvim/database.vim
source ~/.config/nvim/debug.vim
source ~/.config/nvim/format.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/git.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/neoterm.vim
source ~/.config/nvim/snippets.vim
source ~/.config/nvim/syntax.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/tex.vim
source ~/.config/nvim/vista.vim
