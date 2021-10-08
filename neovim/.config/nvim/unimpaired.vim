" unimpaired.vim - Pairs of handy bracket mappings
"
" Smaller, lighter version of tpope's unimpaired plugin.
" Original Author: Tim Pope <http://tpo.pe/>

if exists('g:loaded_unimpaired') || &compatible || v:version < 700
  finish
endif
let g:loaded_unimpaired = 1

let s:maps = []
function! s:Map(...) abort
  call add(s:maps, copy(a:000))
  return ''
endfunction

function! s:maps() abort
  for [mode, head, rhs; rest] in s:maps
    let flags = get(rest, 0, '') . (rhs =~# '^<Plug>' ? '' : '<script>')
    let tail = ''
    let keys = get(g:, mode.'remap', {})
    if type(keys) != type({})
      continue
    endif
    while !empty(head) && len(keys)
      if has_key(keys, head)
        let head = keys[head]
        if empty(head)
          let head = '<skip>'
        endif
        break
      endif
      let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
      let head = substitute(head, '<[^<>]*>$\|.$', '', '')
    endwhile
    if head !=# '<skip>' && empty(maparg(head.tail, mode))
      exe mode.'map' flags head.tail rhs
    endif
  endfor
endfunction

" Section: Next and previous

function! s:MapNextFamily(map,cmd) abort
  let prefix = '<Plug>(unimpaired-' . a:cmd
  let map = '<Plug>unimpaired'.toupper(a:map)
  let cmd = '".(v:count ? v:count : "")."'.a:cmd
  let end = '"<CR>'.(a:cmd ==# 'l' || a:cmd ==# 'c' ? 'zv' : '')
  execute 'nnoremap <silent> '.prefix.'previous) :<C-U>exe "'.cmd.'previous'.end
  execute 'nnoremap <silent> '.prefix.'next)     :<C-U>exe "'.cmd.'next'.end
  execute 'nnoremap <silent> '.prefix.'first)    :<C-U>exe "'.cmd.'first'.end
  execute 'nnoremap <silent> '.prefix.'last)     :<C-U>exe "'.cmd.'last'.end
  execute 'nnoremap <silent> '.map.'Previous :<C-U>exe "'.cmd.'previous'.end
  execute 'nnoremap <silent> '.map.'Next     :<C-U>exe "'.cmd.'next'.end
  execute 'nnoremap <silent> '.map.'First    :<C-U>exe "'.cmd.'first'.end
  execute 'nnoremap <silent> '.map.'Last     :<C-U>exe "'.cmd.'last'.end
  exe s:Map('n', '['.        a:map , prefix.'previous)')
  exe s:Map('n', ']'.        a:map , prefix.'next)')
  exe s:Map('n', '['.toupper(a:map), prefix.'first)')
  exe s:Map('n', ']'.toupper(a:map), prefix.'last)')
  if a:cmd ==# 'c' || a:cmd ==# 'l'
    execute 'nnoremap <silent> '.prefix.'pfile)  :<C-U>exe "'.cmd.'pfile'.end
    execute 'nnoremap <silent> '.prefix.'nfile)  :<C-U>exe "'.cmd.'nfile'.end
    execute 'nnoremap <silent> '.map.'PFile :<C-U>exe "'.cmd.'pfile'.end
    execute 'nnoremap <silent> '.map.'NFile :<C-U>exe "'.cmd.'nfile'.end
    exe s:Map('n', '[<C-'.toupper(a:map).'>', prefix.'pfile)')
    exe s:Map('n', ']<C-'.toupper(a:map).'>', prefix.'nfile)')
  elseif a:cmd ==# 't'
    nnoremap <silent> <Plug>(unimpaired-ptprevious) :<C-U>exe v:count1 . "ptprevious"<CR>
    nnoremap <silent> <Plug>(unimpaired-ptnext) :<C-U>exe v:count1 . "ptnext"<CR>
    execute 'nnoremap <silent> '.map.'PPrevious :<C-U>exe "p'.cmd.'previous'.end
    execute 'nnoremap <silent> '.map.'PNext :<C-U>exe "p'.cmd.'next'.end
    exe s:Map('n', '[<C-T>', '<Plug>(unimpaired-ptprevious)')
    exe s:Map('n', ']<C-T>', '<Plug>(unimpaired-ptnext)')
  endif
endfunction

call s:MapNextFamily('l','l')
call s:MapNextFamily('q','c')

" Section: Diff

nnoremap <silent> <Plug>(unimpaired-context-previous) :<C-U>call <SID>Context(1)<CR>
nnoremap <silent> <Plug>(unimpaired-context-next)     :<C-U>call <SID>Context(0)<CR>
vnoremap <silent> <Plug>(unimpaired-context-previous) :<C-U>exe 'normal! gv'<Bar>call <SID>Context(1)<CR>
vnoremap <silent> <Plug>(unimpaired-context-next)     :<C-U>exe 'normal! gv'<Bar>call <SID>Context(0)<CR>
onoremap <silent> <Plug>(unimpaired-context-previous) :<C-U>call <SID>ContextMotion(1)<CR>
onoremap <silent> <Plug>(unimpaired-context-next)     :<C-U>call <SID>ContextMotion(0)<CR>

exe s:Map('n', '[n', '<Plug>(unimpaired-context-previous)')
exe s:Map('n', ']n', '<Plug>(unimpaired-context-next)')
exe s:Map('x', '[n', '<Plug>(unimpaired-context-previous)')
exe s:Map('x', ']n', '<Plug>(unimpaired-context-next)')
exe s:Map('o', '[n', '<Plug>(unimpaired-context-previous)')
exe s:Map('o', ']n', '<Plug>(unimpaired-context-next)')

nnoremap <silent> <Plug>unimpairedContextPrevious :<C-U>call <SID>Context(1)<CR>
nnoremap <silent> <Plug>unimpairedContextNext     :<C-U>call <SID>Context(0)<CR>
xnoremap <silent> <Plug>unimpairedContextPrevious :<C-U>exe 'normal! gv'<Bar>call <SID>Context(1)<CR>
xnoremap <silent> <Plug>unimpairedContextNext     :<C-U>exe 'normal! gv'<Bar>call <SID>Context(0)<CR>
onoremap <silent> <Plug>unimpairedContextPrevious :<C-U>call <SID>ContextMotion(1)<CR>
onoremap <silent> <Plug>unimpairedContextNext     :<C-U>call <SID>ContextMotion(0)<CR>

function! s:Context(reverse) abort
  call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', a:reverse ? 'bW' : 'W')
endfunction

function! s:ContextMotion(reverse) abort
  if a:reverse
    -
  endif
  call search('^@@ .* @@\|^diff \|^[<=>|]\{7}[<=>|]\@!', 'bWc')
  if getline('.') =~# '^diff '
    let end = search('^diff ', 'Wn') - 1
    if end < 0
      let end = line('$')
    endif
  elseif getline('.') =~# '^@@ '
    let end = search('^@@ .* @@\|^diff ', 'Wn') - 1
    if end < 0
      let end = line('$')
    endif
  elseif getline('.') =~# '^=\{7\}'
    +
    let end = search('^>\{7}>\@!', 'Wnc')
  elseif getline('.') =~# '^[<=>|]\{7\}'
    let end = search('^[<=>|]\{7}[<=>|]\@!', 'Wn') - 1
  else
    return
  endif
  if end > line('.')
    execute 'normal! V'.(end - line('.')).'j'
  elseif end == line('.')
    normal! V
  endif
endfunction

" Section: Line operations

function! s:BlankUp() abort
  let cmd = 'put!=repeat(nr2char(10), v:count1)|silent '']+'
  if &modifiable
    let cmd .= '|silent! call repeat#set("\<Plug>(unimpaired-blank-up)", v:count1)'
  endif
  return cmd
endfunction

function! s:BlankDown() abort
  let cmd = 'put =repeat(nr2char(10), v:count1)|silent ''[-'
  if &modifiable
    let cmd .= '|silent! call repeat#set("\<Plug>(unimpaired-blank-down)", v:count1)'
  endif
  return cmd
endfunction

nnoremap <silent> <Plug>(unimpaired-blank-up)   :<C-U>exe <SID>BlankUp()<CR>
nnoremap <silent> <Plug>(unimpaired-blank-down) :<C-U>exe <SID>BlankDown()<CR>

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>exe <SID>BlankUp()<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>exe <SID>BlankDown()<CR>

exe s:Map('n', '[<Space>', '<Plug>(unimpaired-blank-up)')
exe s:Map('n', ']<Space>', '<Plug>(unimpaired-blank-down)')

function! s:ExecMove(cmd) abort
  let old_fdm = &foldmethod
  if old_fdm !=# 'manual'
    let &foldmethod = 'manual'
  endif
  normal! m`
  silent! exe a:cmd
  norm! ``
  if old_fdm !=# 'manual'
    let &foldmethod = old_fdm
  endif
endfunction

function! s:Move(cmd, count, map) abort
  call s:ExecMove('move'.a:cmd.a:count)
  silent! call repeat#set('\<Plug>(unimpaired-move-'.a:map.')', a:count)
endfunction

function! s:MoveSelectionUp(count) abort
  call s:ExecMove("'<,'>move'<--".a:count)
  silent! call repeat#set("\<Plug>(unimpaired-move-selection-up)", a:count)
endfunction

function! s:MoveSelectionDown(count) abort
  call s:ExecMove("'<,'>move'>+".a:count)
  silent! call repeat#set("\<Plug>(unimpaired-move-selection-down)", a:count)
endfunction

nnoremap <silent> <Plug>(unimpaired-move-up)            :<C-U>call <SID>Move('--',v:count1,'up')<CR>
nnoremap <silent> <Plug>(unimpaired-move-down)          :<C-U>call <SID>Move('+',v:count1,'down')<CR>
noremap  <silent> <Plug>(unimpaired-move-selection-up)   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>(unimpaired-move-selection-down) :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>
nnoremap <silent> <Plug>unimpairedMoveUp            :<C-U>call <SID>Move('--',v:count1,'up')<CR>
nnoremap <silent> <Plug>unimpairedMoveDown          :<C-U>call <SID>Move('+',v:count1,'down')<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionUp   :<C-U>call <SID>MoveSelectionUp(v:count1)<CR>
noremap  <silent> <Plug>unimpairedMoveSelectionDown :<C-U>call <SID>MoveSelectionDown(v:count1)<CR>

exe s:Map('n', '[e', '<Plug>(unimpaired-move-up)')
exe s:Map('n', ']e', '<Plug>(unimpaired-move-down)')
exe s:Map('x', '[e', '<Plug>(unimpaired-move-selection-up)')
exe s:Map('x', ']e', '<Plug>(unimpaired-move-selection-down)')

" Section: Option toggling

nnoremap yoc :setlocal cursorline!<CR>
nnoremap yol :setlocal list!<CR>
nnoremap yon :setlocal number!<CR>
nnoremap yor :setlocal relativenumber!<CR>
nnoremap yos :setlocal spell!<CR>
nnoremap yow :setlocal wrap!<CR>

" Section: Activation

call s:maps()
