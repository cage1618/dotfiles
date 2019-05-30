" ==========================================
set nocompatible
filetype off


call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'

" ================== FZF ==================
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

" System copy
Plug 'christoomey/vim-system-copy'

" Color scheme
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'fatih/molokai'
let g:molokai_original = 1
let g:rehash256 = 1
let g:one_allow_italics = 0
set background=dark


" For tmux navigator Ctrl-hjkl
Plug 'christoomey/vim-tmux-navigator'


" Fish syntax
" Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/fish-syntax'


" Linter
Plug 'w0rp/ale'
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'go': ['golangci-lint'],
\}
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--fast -E golint --exclude-use-default=false'
let g:ale_python_flake8_options = '--ignore=F821,E501'
let g:ale_python_pylint_options = '--disable=C0111,C0301,R0902,R0903,R0913,R0914,R0915,E1101,E1004'


" Python code formatter
Plug 'mindriot101/vim-yapf'
autocmd FileType python nnoremap <leader>y :Yapf<Cr>


" YouCompleteMe
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --go-completer --clang-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" let g:ycm_key_list_select_completion=['<c-j>']
" let g:ycm_key_list_previous_completion=['<c-k>']
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_gocode_binary_path = '/Users/Liao/Projects/go/bin/gocode'
let g:ycm_godef_binary_path = '/Users/Liao/Projects/go/bin/godef'
let g:ycm_seed_identifiers_with_syntax=0

" Turn off scratch preview
" set completeopt-=preview
"
" let g:ycm_goto_buffer_command = 'horizontal-split'
" let g:ycm_goto_buffer_command = 'new-tab'
let g:ycm_goto_buffer_command = 'vertical-split'
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" invoke completion
" let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'gitcommit' : 1,
      \ 'fzf': 1,
      \ 'ctrlp': 1
      \}


" Ultimate Snippet
" " Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Auto complete for quote marks
Plug 'Raimondi/delimitMate'


" Auto complete for html/xml tags
Plug 'docunext/closetag.vim'
let g:closetag_html_style=1


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


" Comment shortcuts
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1


" Modify surround characters
Plug 'tpope/vim-surround'


" For repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'


" Remove trailing whitespaces
Plug 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>


" Align statements
Plug 'junegunn/vim-easy-align'
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }


" Show git diff
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
nnoremap <leader>gs :GitGutterToggle<CR>


" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='one'
let g:airline#extensions#ale#enabled = 1


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


" Nerdtree
Plug 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" s/v to open file in split window
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

Plug 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" nerdtree synchronization
"let g:nerdtree_tabs_synchronize_view=0
"let g:nerdtree_tabs_synchronize_focus=0
" auto start nerdtree
"let g:nerdtree_tabs_open_on_console_startup=1

" nerdtree git support
Plug 'Xuyuanp/nerdtree-git-plugin'


" Vim tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
" Stop gutentags getting upset in short-lived sessions
" https://github.com/ludovicchabant/vim-gutentags/issues/178
 let g:gutentags_exclude_filetypes=['gitcommit']


Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>


" ###### Python #########
" for python.vim syntax highlight
Plug 'hdima/python-syntax'
let python_highlight_all = 1


" ###### Golang #########
Plug 'fatih/vim-go'
let g:go_def_reuse_buffer = 1
" let g:go_def_mode = 'guru'
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_metalinter_command = 'golangci-lint'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']
" auto highlight same vars
let g:go_auto_sameids = 1
" map gd to go def
" let g:go_def_mapping_enabled = 0
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" jump to def in splited vertical window
autocmd FileType go map <C-s>] <Plug>(go-def-vertical)
autocmd FileType go map <C-s><C-]> <Plug>(go-def-vertical)
autocmd FileType go map <C-t>] <Plug>(go-def-tab)
autocmd FileType go map <C-t><C-]> <Plug>(go-def-tab)

autocmd FileType go noremap <leader>ga :GoAlternate<cr>
autocmd FileType go noremap <leader>gi :GoInfo<cr>
autocmd FileType go noremap <leader>b :GoBuild<cr>
autocmd FileType go noremap <leader>r :GoRun<cr>

autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" ###### Ruby #########
Plug 'vim-ruby/vim-ruby'
"Bundle 'nelstrom/vim-textobj-rubyblock'

" 有bug, 和当前有冲突, 尚未解决, 不要打开
" Bundle 'tpope/vim-endwise'
" Bundle 'tpope/vim-rails'


" ###### Markdown #########
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

" https://github.com/suan/vim-instant-markdown
" npm -g install instant-markdown-d
" Bundle 'suan/vim-instant-markdown'
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" map <F12> :InstantMarkdownPreview<CR>

" ###### HTML/JS/JQUERY/CSS #########

" for javascript  注意: syntax这个插件要放前面
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" ###### emmet HTML complete #########
" Bundle "mattn/emmet-vim"

" ###### vim.less : less 自动更新##########
" Bundle 'groenewege/vim-less'
" autocmd BufWritePost *.less :!lessc % > %:p:r.css

" ###### Jinja2 #########
Plug 'Glench/Vim-Jinja2-Syntax'

" ##### Puppet Syntax ########
Plug 'godlygeek/tabular'

" ##### indent guide ########
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_enabled = 0
nnoremap <leader>ig :IndentLinesToggle <CR>

" ###### nginx #########
Plug 'chr4/nginx.vim'
Plug 'liaoishere/vim-puppet'
" ###### tabline ######
Plug 'mkitt/tabline.vim'

if !has('nvim')
    Plug 'ConradIrwin/vim-bracketed-paste'
endif

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


" #### vim-signature ####
Plug 'kshenoy/vim-signature'

" #### Ag & Ack ####
Plug 'rizzatti/dash.vim'

call plug#end()
filetype plugin on
