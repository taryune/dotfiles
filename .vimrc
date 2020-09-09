filetype plugin indent on
filetype indent on

set backspace=indent,eol,start
syntax on
set number
set nocompatible
set clipboard=unnamed,unnamedplus
set cursorline
set mouse=a
let g:tex_conceal=''

" Tab settings
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" Mappings
nmap <F1> <Nop>
nnoremap ; :

" Split
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sv :<C-u>vs<CR>
nnoremap sO <C-w>=

"Tab
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" flutter hot reload
function! TriggerFlutterHotReload() abort
  silent execute '!kill -SIGUSR1 $(pgrep -f "[f]lutter_tool.*run")'
endfunction
autocmd! BufWritePost *.dart call TriggerFlutterHotReload()
