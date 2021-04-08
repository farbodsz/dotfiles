" =============================================================================
" Syntax improvements
" =============================================================================

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
