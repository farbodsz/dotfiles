" =============================================================================
" Syntax improvements
" =============================================================================

lua require("farbodsz.treesitter")

augroup filetypes
  au!

  " .clang-format
  au BufNewFile,BufRead *.clang-format set syntax=yaml

  " i3config
  au BufNewFile,BufRead ~/.dotfiles/i3/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.dotfiles/i3/.config/i3blocks/config
        \ set filetype=config

  " .luacheckrc
  au BufNewFile,BufRead .luacheckrc set filetype=lua

  " Mutt filetypes
  au BufNewFile,BufRead *.muttrc set filetype=muttrc
  au BufNewFile,BufRead *mutt-* set filetype=mail
aug end
