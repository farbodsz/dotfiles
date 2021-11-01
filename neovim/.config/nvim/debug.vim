" =============================================================================
" Debugging configuration
" =============================================================================

lua require("farbodsz.debug")

nmap <leader>dd :lua require("dap").continue()<CR>
nmap <leader>d_ :lua require("dap").run_last()<CR>

nmap <leader>d<space> :lua require("dap").run_to_cursor()<CR>
nmap <leader>dq :lua require("farbodsz.debug.utils").disconnect_and_close()<CR>

nmap <leader>dk :lua require("dap").step_out()<CR>
nmap <leader>dj :lua require("dap").step_into()<CR>
nmap <leader>dl :lua require("dap").step_over()<CR>

nmap <leader>dfk :lua require("dap").up()<CR>
nmap <leader>dfj :lua require("dap").down()<CR>

nmap <leader>dp :lua require("dap").toggle_breakpoint()<CR>
nmap <leader>dPc :lua require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nmap <leader>dPl :lua require("dap").list_breakpoints()<CR>

sign define DapBreakpoint text=🛑
sign define DapLogPoint text=🔵
sign define DapBreakpointRejected text=❌

" Use OSV to debug Lua plugins (pneumonic: debug extension)
nmap <leader>dX :lua require("osv").launch({ log = true })<CR>

" nvim-dap-ui
nmap <leader>dw :lua require("dapui").toggle()<CR>
vmap <leader>di :lua require("dapui").eval()<CR>
nmap <leader>di viw :lua require("dapui").eval()<CR>

" nvim-dap-virtual-text
let g:dap_virtual_text = 'all frames'
