" Keybind configs

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

inoremap kj <Esc>

"Map ; to : and save a million keystrokes
"" ex mode commands made easy 用于快速进入命令行
nnoremap ; :
" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Shortcut for command mode
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" F2 Toggle line numbers
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc

noremap <F2> :call HideNumber()<CR>
noremap! <F2> <C-[>::call HideNumber()<CR>

" F3 Toggle ALE
noremap <F3> :ALEToggle<CR>
noremap! <F3> <C-[>:ALEToggle<CR>

" F4 Toggle text wrap
noremap <F4> :call ToggleWrap()<CR>
noremap! <F4> <C-[>:call ToggleWrap()<CR>

" F5 Open Terminal
if has('nvim')
    noremap <F5> :terminal<CR>
endif

" F6 Toggle non-printable characters displaying
function! ToggleWrap()
 if (&wrap == 1)
   set nowrap
 else
   set wrap
 endif
endfunction

noremap <F6> :set list! list?<CR>
noremap! <F6> <C-[>:set list! list?<CR>

" F7 Toggle syntax
noremap <F7> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
"""

" Ctrl-n Toggle relative number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
set norelativenumber number

" tab 操作
" TODO: ctrl + n 变成切换tab的方法
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
"map <C-2> 2gt
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
noremap <silent> <F1> :execute 'tabnext ' . g:last_active_tab<cr>
noremap <silent> <F1> :execute 'tabnext ' . g:last_active_tab<cr>
noremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
noremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()


" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" buffer access
nnoremap <leader>l :ls<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>b1 :1b<CR>
nnoremap <leader>b2 :2b<CR>
nnoremap <leader>b3 :3b<CR>
nnoremap <leader>b4 :4b<CR>
nnoremap <leader>b5 :5b<CR>
nnoremap <leader>b6 :6b<CR>
nnoremap <leader>b7 :7b<CR>
nnoremap <leader>b8 :8b<CR>
nnoremap <leader>b9 :9b<CR>
