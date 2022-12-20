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

let s:is_work_profile = getenv('IS_WORK_PROFILE')
if s:is_work_profile !=? 'yes'
  source ~/.config/nvim/database.vim
endif

source ~/.config/nvim/confluence.vim
source ~/.config/nvim/debug.vim
source ~/.config/nvim/dispatch.vim
source ~/.config/nvim/firenvim.vim
source ~/.config/nvim/git.vim
source ~/.config/nvim/nav_windows.vim
source ~/.config/nvim/octo.vim
source ~/.config/nvim/refactoring.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/unimpaired.vim

lua require("farbodsz.harpoon").setup()
