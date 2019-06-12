set nocompatible
filetype off
call plug#begin('~/.vim/bundle')

" MISC tools ================================================================{{{

if !has('nvim')
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Modify surround characters
Plug 'tpope/vim-surround'

" System copy
Plug 'christoomey/vim-system-copy'

" For tmux navigator Ctrl-hjkl
Plug 'christoomey/vim-tmux-navigator'

" Fish syntax
" Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/fish-syntax'

" Select in visual
Plug 'terryma/vim-expand-region'
" map + <Plug>(expand_region_expand)
" map _ <Plug>(expand_region_shrink)
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Multi cursor
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" For repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'

" Remove trailing whitespaces
Plug 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>
let g:extra_whitespace_ignored_filetypes = ['defx']

" Align statements
Plug 'junegunn/vim-easy-align'
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" Rainbow parentheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 0
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

" Tabline
Plug 'mkitt/tabline.vim'

" Dash integration
Plug 'rizzatti/dash.vim'

" }}}


" Git ======================================================================={{{
" Git wrapper
Plug 'tpope/vim-fugitive'

" Show git diff
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
nnoremap <leader>gs :GitGutterToggle<CR>
" }}}


" FZF ======================================================================={{{
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Ag grep
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" Rg grep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>bl :BLines<CR>
" }}}


" Defx ======================================================================{{{
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
map <silent> - :Defx<CR>
" Avoid the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/
" Keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

" Defx git
Plug 'kristijanhusak/defx-git'
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" Defx icons
" Requires nerd-font, install at https://github.com/ryanoasis/nerd-fonts or
" brew cask install font-hack-nerd-font
" Then set non-ascii font to Driod sans mono for powerline in iTerm2
Plug 'kristijanhusak/defx-icons'
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1

" }}}


" Color Themes =============================================================={{{
Plug 'flazz/vim-colorschemes'
" Fix comment color of 'rakr/vim-one'
Plug 'liaoishere/vim-one'
Plug 'joshdick/onedark.vim'
let g:one_allow_italics = 1
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'colepeters/spacemacs-theme.vim'
Plug 'fatih/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

set background=dark

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='one'
let g:airline#extensions#ale#enabled = 1

" }}}


" Code tools ================================================================{{{

" Auto complete for quote marks
Plug 'Raimondi/delimitMate'

" Auto complete for html/xml tags
Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

" Comment shortcuts
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_enabled = 0
nnoremap <leader>ig :IndentLinesToggle <CR>

" Golang ===================================================================={{{
Plug 'fatih/vim-go'
let g:go_def_reuse_buffer = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_metalinter_command = 'golangci-lint'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']

" auto highlight same vars
let g:go_auto_sameids = 1

let g:go_auto_type_info = 1

" enrich highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" toggle the default go def mappings
let g:go_def_mapping_enabled = 1

" jump to def in splited vertical window
autocmd FileType go map <buffer> <C-s><C-]> <Plug>(go-def-vertical)
autocmd FileType go map <buffer> <C-s>] <Plug>(go-def-vertical)
autocmd FileType go map <buffer> <C-t><C-]> <Plug>(go-def-tab)
autocmd FileType go map <buffer> <C-t>] <Plug>(go-def-tab)
autocmd FileType go map <buffer> <C-w><C-]> <Plug>(go-def-split)
autocmd FileType go map <buffer> <C-w>] <Plug>(go-def-split)

autocmd FileType go noremap <buffer> <leader>ga :GoAlternate<cr>
autocmd FileType go noremap <buffer> <leader>gi :GoInfo<cr>
autocmd FileType go noremap <buffer> <leader>bt :GoDecls<cr>
autocmd FileType go noremap <buffer> <leader>gf :GoDeclsDir<cr>
autocmd FileType go noremap <buffer> <leader>b :GoBuild<cr>
autocmd FileType go noremap <buffer> <leader>r :GoRun<cr>

autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" }}}

" Python ===================================================================={{{
Plug 'mindriot101/vim-yapf'
autocmd FileType python nnoremap <leader>y :Yapf<Cr>
"
" Python syntax highlight
Plug 'hdima/python-syntax'
let python_highlight_all = 1

"Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'
" }}}

" Ruby ======================================================================{{{
Plug 'vim-ruby/vim-ruby'
" Plug 'nelstrom/vim-textobj-rubyblock'

" These plugs may have bugs
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-rails'
" }}}

" HTML/JS/CSS ==============================================================={{{

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" emmet HTML complete
" Plug "mattn/emmet-vim"

" Less
" Plug 'groenewege/vim-less'
" autocmd BufWritePost *.less :!lessc % > %:p:r.css
" }}}

" Markdown =================================================================={{{
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
" https://github.com/suan/vim-instant-markdown
" npm -g install instant-markdown-d
" Bundle 'suan/vim-instant-markdown'
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" map <F12> :InstantMarkdownPreview<CR>
" }}}

" Puppet ===================================================================={{{
Plug 'godlygeek/tabular'
Plug 'liaoishere/vim-puppet'
" }}}

" Nginx ====================================================================={{{
Plug 'chr4/nginx.vim'
" }}}

" Linters ==================================================================={{{
Plug 'w0rp/ale'
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'go': ['golangci-lint'],
\}
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--fast -E golint --exclude-use-default=false'
let g:ale_python_flake8_options = '--ignore=F821,E501'
let g:ale_python_pylint_options = '--disable=C0111,C0301,R0902,R0903,R0913,R0914,R0915,E1101,E1004'
" }}}

" YouCompleteMe ============================================================={{{
"# function! BuildYCM(info)
"#   " info is a dictionary with 3 fields
"#   " - name:   name of the plugin
"#   " - status: 'installed', 'updated', or 'unchanged'
"#   " - force:  set on PlugInstall! or PlugUpdate!
"#   if a:info.status == 'installed' || a:info.force
"#     !./install.py --go-completer --clang-completer
"#   endif
"# endfunction
"# Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"# " let g:ycm_key_list_select_completion=['<c-j>']
"# " let g:ycm_key_list_previous_completion=['<c-k>']
"# let g:ycm_complete_in_comments = 1
"# let g:ycm_complete_in_strings = 1
"# let g:ycm_use_ultisnips_completer = 1
"# let g:ycm_collect_identifiers_from_comments_and_strings = 1
"# let g:ycm_collect_identifiers_from_tags_files = 1
"# let g:ycm_gocode_binary_path = '/Users/Liao/Projects/go/bin/gocode'
"# let g:ycm_godef_binary_path = '/Users/Liao/Projects/go/bin/godef'
"# let g:ycm_seed_identifiers_with_syntax=0
"#
"# " Turn off scratch preview
"# set completeopt-=preview
"# "
"# " let g:ycm_goto_buffer_command = 'horizontal-split'
"# " let g:ycm_goto_buffer_command = 'new-tab'
"# let g:ycm_goto_buffer_command = 'vertical-split'
"# " nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"# nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
"# nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
"# " invoke completion
"# " let g:ycm_key_invoke_completion = '<C-Space>'
"# let g:ycm_filetype_blacklist = {
"#       \ 'tagbar' : 1,
"#       \ 'gitcommit' : 1,
"#       \ 'fzf': 1,
"#       \ 'ctrlp': 1
"#       \}
"
" }}}

" coc.nvim =================================================================={{{
" Installed extensions:
" coc-snippets
" coc-highlight
" coc-yaml
" coc-python
" coc-json
" coc-html
" coc-css
" coc-vimlsp
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
function! s:isGoFile()
  for ft in g:extra_whitespace_ignored_filetypes
    if 'go' ==# &filetype | return 0 | endif
  endfor
return 1
endfunction
" These two key map conflicts with vim-go, so skip them in go files
autocmd * if <SID>isGoFile() | nmap <silent> <C-LeftMouse> <LeftMouse><Plug>(coc-definition) | endif
autocmd * if <SID>isGoFile() | nmap <silent> g<LeftMouse> <LeftMouse><Plug>(coc-definition) | endif
autocmd * if <SID>isGoFile() | nmap <silent> gd <Plug>(coc-definition) | endif

nmap <silent> <M-LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <silent> <leader>jd :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use C to open coc config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" coc-snippets extension config
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc-vimlsp extension config
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" }}}

" Ultimate Snippet =========================================================={{{
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" Code tags ================================================================={{{
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
" Stop gutentags getting upset in short-lived sessions
" https://github.com/ludovicchabant/vim-gutentags/issues/178
 let g:gutentags_exclude_filetypes=['gitcommit']

" Code signature
Plug 'kshenoy/vim-signature'
" }}}

" Quick run ================================================================={{{
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>
" }}}

" }}}


" Search ===================================================================={{{
" Plug 'haya14busa/is.vim'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'osyo-manga/vim-anzu'
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
set statusline=%{anzu#search_status()}
" }}}

call plug#end()
filetype plugin on

" vim: set fdl=0 fdm=marker: