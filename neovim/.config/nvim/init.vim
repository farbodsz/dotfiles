" =============================================================================
" NeoVim configuration
" Author: Farbod Salamat-Zadeh
" =============================================================================

" Load default mappings and keybindings
source ~/.config/nvim/defaults.vim
source ~/.config/nvim/mappings.vim

lua require("farbodsz.plugins")
lua require("impatient")

source ~/.config/nvim/theme.vim

lua require("farbodsz.completion").setup()
lua require("farbodsz.lsp")

lua require("farbodsz.treesitter")

source ~/.config/nvim/database.vim
source ~/.config/nvim/debug.vim
source ~/.config/nvim/dispatch.vim
source ~/.config/nvim/firenvim.vim
source ~/.config/nvim/git.vim
source ~/.config/nvim/haskell.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/neoterm.vim
source ~/.config/nvim/octo.vim
source ~/.config/nvim/refactoring.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/tex.vim
source ~/.config/nvim/undotree.vim
source ~/.config/nvim/unimpaired.vim
source ~/.config/nvim/vista.vim
