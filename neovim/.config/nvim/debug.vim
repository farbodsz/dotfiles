" =============================================================================
" Debugging configuration
" =============================================================================

let g:vimspector_install_gadgets = ['debugpy']

nmap <leader>dd :call vimspector#Launch()<cr>

nmap <leader>d<space> :call vimspector#Continue()<cr>
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dq :call vimspector#Reset()<cr>

nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>dj <Plug>VimspectorStepInto
nmap <leader>dl <Plug>VimspectorStepOver

nmap <leader>di <Plug>VimspectorBalloonEval
xmap <leader>di <Plug>VimspectorBalloonEval

nmap <leader>dp <Plug>VimspectorToggleBreakpoint
nmap <leader>dPc <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>dPf <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>dPdd <Plug>VimspectorClearBreakpoints
nmap <leader>dPl :call vimspector#ListBreakpoints()<cr>

nmap <leader>dc :call win_gotoid(g:vimspector_session_windows.code)<cr>
nmap <leader>dv :call win_gotoid(g:vimspector_session_windows.variables)<cr>
nmap <leader>dw :call win_gotoid(g:vimspector_session_windows.watches)<cr>


" Set custom syntax highlighting for buffers
function! s:SetupVimspectorSyntax()
  call win_gotoid(g:vimspector_session_windows.stack_trace)
  setlocal ft=vimspectorStackTrace

  call win_gotoid(g:vimspector_session_windows.variables)
  setlocal ft=vimspectorVariables

  call win_gotoid(g:vimspector_session_windows.watches)
  setlocal ft=vimspectorWatches
endfunction

augroup vimspector_ui_customisations
  au!
  au User VimspectorUICreated call s:SetupVimspectorSyntax()
augroup end
