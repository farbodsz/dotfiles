" ~~~~~~~
" GENERAL 
" ~~~~~~~

" Encoding
set encoding=utf-8

" Whitespace and indentation
set expandtab
set textwidth=80
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nowrap
set autoindent
set smartindent

" Text width
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey

" Language-specific overrides for whitespace
autocmd FileType javascript,css,sass,scss,json,yaml,sh setlocal ts=2 sw=2 expandtab 

" Leader key
let mapleader = " "

" Show sign columns
set signcolumn=yes

" Stop newline continuation of comments
set formatoptions-=cro

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/ = ''<cr>

" Show relative line numbers
set number
set relativenumber

" Show file stats
set ruler

" Vim auto-indents when pasting, set a toggle for this
set pastetoggle=<F3>

" Automatically use system clipboard for copy/paste
set clipboard=unnamedplus

" Give more space for displaying messages
set cmdheight=2

" Enable mouse
set mouse=a

" Auto source init.vim on save
au! BufWritePost $MYVIMRC source %


" ~~~~~~~~
" MAPPINGS
" ~~~~~~~~

" Save
nnoremap <leader>w :w<CR>

" Yank file contents
nnoremap <leader>y :%y<CR>

" Window navigation and resizing
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Open this init.vim
nnoremap <C-M-s> :e ~/.config/nvim/init.vim<CR>


" ~~~~~~~~~
" EXECUTION
" ~~~~~~~~~

autocmd FileType cpp setlocal makeprg=g++\ -g\ -std=c++14\ -Wall\ -o\ %< %

map <F9> <ESC>:w<CR>:make<CR>


" ~~~~~~~ 
" PLUGINS
" ~~~~~~~

call plug#begin()

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'sjl/badwolf', { 'as': 'badwolf' }

" Lightline
Plug 'itchyny/lightline.vim'

" Display indentation levels with vertical lines
Plug 'Yggdroot/indentLine'

" Navigation plugins
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'

" Syntax highlighting improvements
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neovimhaskell/haskell-vim'

" Auto-completion 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Auto-formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/vim-clang-format'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'meck/vim-brittany'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Show hex colors
Plug 'chrisbra/Colorizer'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()


" ~~~~~
" THEME
" ~~~~~

" Set theme
syntax on
colorscheme badwolf
set background=dark
set termguicolors

" Badwolf theme customisation
" Turn on CSS properties highlighting
let g:badwolf_css_props_highlight = 1

" Lightline customisation
" Removed: fileencoding, fileformat
let g:lightline = {
            \ 'colorscheme': 'powerline',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \   'right': [ [ 'lineinfo' ], 
            \              [ 'percent' ], 
            \              [ 'gitstatus', 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead',
            \   'gitstatus': 'GitStatus',
            \   'cocstatus': 'coc#status'
            \ },
            \ }

" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" Use autocmd to force lightline update for Coc
autocmd User CocStatusChange, CocDiagnosticChange call lightline#update()

" GitGutter summary
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction

" Colorizer
let g:colorizer_skip_comments = 1
let g:colorizer_colornames = 0

" Disable indentLine by default 
let g:indentLine_enabled = 0
" Indent line customisation
let g:indentLine_char = '⎸'


" ~~~~~~~~
" NERDTREE
" ~~~~~~~~

" Open NERDTree automatically on startup
autocmd vimenter * NERDTree

" Close Vim if only window left is NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Keybindings
nnoremap <leader>t :NERDTreeToggle<CR>


" ~~~~~~~
" FZF.VIM
" ~~~~~~~

nnoremap <silent> <leader><tab> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>' :Marks<CR>


" ~~~~~~~~~
" GITGUTTER
" ~~~~~~~~~

" Clear default mappings for GitGutter
let g:gitgutter_map_keys = 0

" Navigate git hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Preview/stage/undo hunks when cursor is in it
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)

" Toggle line highlighting
nmap <leader>hh :GitGutterLineHighlightsToggle<cr>

" Hunk text objects in visual and operator-pending modes
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)


" ~~~~~~~
" COC.VIM
" ~~~~~~~

" TextEdit might fail if hidden not set
set hidden

" Make update time shorter
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Navigate diagnostics and get all for current buffer in location list
nmap <leader>]g <Plug>(coc-diagnostic-prev)
nmap <leader>[g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply codeAction to selected region (e.g. <leader>aap for paragraph)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line ("quick-fix")
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" ~~~~~~~~~~~~~~~
" AUTO-FORMATTING
" ~~~~~~~~~~~~~~~

" Use <leader>cf for [c]ode [f]ormat 
autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :ClangFormat<cr>
autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<cr>
autocmd FileType javascript,typescript,json,html,css,less,scss,yaml nnoremap <buffer><leader>cf :Prettier<cr>
autocmd FileType python nnoremap <buffer><leader>cf :Isort -m 3 -tc<cr>:Black<cr>
autocmd FileType haskell nnoremap <buffer><leader>cf :Brittany<cr> 
autocmd FileType sh nnoremap <buffer><leader>cf :Shfmt<cr>

" Clang options
let g:clang_format#code_style="google"    " base style
let g:clang_format#style_options={
            \ "AllowShortCaseLabelsOnASingleLine": "true", 
            \ "IndentWidth": 4, 
            \ "AccessModifierOffset": -2, 
            \ "ContinuationIndentWidth": 8}

" Black options
let g:black_linelength=80

" Brittany options
let g:brittany_on_save = 0
let g:brittany_config_file = "~/.config/brittany/config.yaml"

" Shfmt options: like Google style guide
let g:shfmt_extra_args = "-i 2 -ci"
