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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",  -- compile Haskell parser manually
  ignore_install = { },
  -- Highlighting
  highlight = {
    enable = true
  },
  -- Tree-sitter based indentation
  indent = {
    enable = true
  }
}

-- At the moment, some languages compile with errors when compiled with `gcc`.
-- Force `clang` to resolve this and ensure consistency.
require'nvim-treesitter.install'.compilers = { "clang" }

EOF

" Tree-sitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
