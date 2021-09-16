" =============================================================================
" Debugging configuration
" =============================================================================

let g:vimspector_install_gadgets = ['debugpy']
let g:vimspector_base_dir = expand('$HOME/.dotfiles/neovim/.config/nvim/vimspector/')

nnoremap <leader>dd :call vimspector#Launch()<cr>

nnoremap <leader>d<space> :call vimspector#Continue()<cr>
nnoremap <leader>drc :call vimspector#RunToCursor()<cr>
nnoremap <leader>dq :call vimspector#Reset()<cr>

nnoremap <leader>dk :call vimspector#StepOut()<cr>
nnoremap <leader>dj :call vimspector#StepInto()<cr>
nnoremap <leader>dl :call vimspector#StepOver()<cr>

nnoremap <leader>dfk :call vimspector#UpFrame()<cr>
nnoremap <leader>dfj :call vimspector#DownFrame()<cr>

nnoremap <leader>di :call vimspector#BalloonEval()<cr>
xnoremap <leader>di :call vimspector#BalloonEval()<cr>

nnoremap <leader>db :call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>dBc :call vimspector#ToggleConditionalBreakpoint()<cr>
nnoremap <leader>dBf :call vimspector#AddFunctionBreakpoint()<cr>
nnoremap <leader>dBdd :call vimspector#ClearBreakpoints()<cr>
nnoremap <leader>dBa :call vimspector#ListBreakpoints()<cr>
