" dein settings {{{
    if &compatible
      set nocompatible
    endif

    " dein.vim dir
    let s:dein_dir = expand('~/.cache/dein')
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " git clone
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir

    if dein#load_state(s:dein_dir)
      call dein#begin(s:dein_dir)

      " toml
      let s:toml = '~/.dein.toml'
      let s:lazy_toml = '~/.dein_lazy.toml'
      call dein#load_toml(s:toml, {'lazy': 0})
      call dein#load_toml(s:lazy_toml, {'lazy': 1})

      call dein#end()
      call dein#save_state()
    endif

    " check install
    if dein#check_install()
        call dein#install()
    endif
" }}}

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


" Color Scheme
set termguicolors
colorscheme iceberg

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
