" =============================================================================
" NeoVim configuration
" Author: Farbod Salamat-Zadeh
" =============================================================================

" Load default mappings and keybindings
source ~/.config/nvim/defaults.vim
source ~/.config/nvim/mappings.vim

" Disable LSP features in ALE since already provided by built-in LSP
" This needs to be before plugins are loaded.
let g:ale_disable_lsp = 1

lua require("farbodsz.plugins")
lua require("impatient")

source ~/.config/nvim/theme.vim

lua require("farbodsz.lsp")

source ~/.config/nvim/database.vim
source ~/.config/nvim/debug.vim
source ~/.config/nvim/dispatch.vim
source ~/.config/nvim/git.vim
source ~/.config/nvim/haskell.vim
source ~/.config/nvim/markdown.vim
source ~/.config/nvim/neoterm.vim
source ~/.config/nvim/octo.vim
source ~/.config/nvim/snippets.vim
source ~/.config/nvim/syntax.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/tex.vim
source ~/.config/nvim/undotree.vim
source ~/.config/nvim/unimpaired.vim
source ~/.config/nvim/vista.vim
