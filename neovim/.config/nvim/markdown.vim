" =============================================================================
" vim-markdown configuration
" =============================================================================

" Markdown settings
let g:vim_markdown_math = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_fenced_languages = ['graphviz=dot']
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" Use gO (goto outline) - same binding as for vim docs
autocmd FileType markdown nnoremap <buffer>gO :Toch<cr>
