" =============================================================================
" Syntax improvements
" =============================================================================

" i3config detection based on filepath
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.dotfiles/i3/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.dotfiles/i3/.config/i3blocks/config set filetype=config
aug end

" Use YAML syntax for .clang-format files
aug clang_config_syntax
  au!
  au BufNewFile,BufRead *.clang-format set syntax=yaml
aug end

" Mutt
aug mutt_ft_detection
  au!
  au BufNewFile,BufRead *.muttrc set filetype=muttrc
  au BufNewFile,BufRead *mutt-* set filetype=mail
aug end

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- Highlighting
  highlight = {
    enable = true
  },
  -- Tree-sitter based indentation
  indent = {
    enable = true
  }
}

-- At the moment, some languages (e.g. Haskell) compile with errors when
-- compiled with `gcc`.
require'nvim-treesitter.install'.compilers = { "clang" }

EOF
