" =============================================================================
" firenvim configuration
" =============================================================================

" " Setup a shortcut variable to the per site settings array
" let s:fc = {}
" let g:firenvim_config = { 'localSettings': s:fc }

" " Enable Firenvim but not activated by default
" let s:fc['.*'] = {
"       \ 'selector': 'textarea, div[role="textbox"]',
"       \ 'priority': 0, 'takeover': 'never'
"       \ }

if exists('g:started_by_firenvim') && g:started_by_firenvim
  set laststatus=0 nonumber noruler noshowcmd
endif
