vim.api.nvim_set_keymap("n", "<C-e>", ":Fern . -reveal=% -drawer -toggle<CR>", { noremap = true, silent = true })
vim.g["fern#default_hidden"] = 1

-- Fern custom mappings and settings
vim.cmd([[
  function! s:init_fern() abort
    " Define NERDTree like mappings
    nmap <buffer> o <Plug>(fern-action-open:edit)
    nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
    nmap <buffer> t <Plug>(fern-action-open:tabedit)
    nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
    nmap <buffer> i <Plug>(fern-action-open:split)
    nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
    nmap <buffer> s <Plug>(fern-action-open:vsplit)
    nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
    nmap <buffer> ma <Plug>(fern-action-new-path)
    nmap <buffer> P gg
    nmap <buffer> C <Plug>(fern-action-enter)
    nmap <buffer> u <Plug>(fern-action-leave)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
    nmap <buffer> cd <Plug>(fern-action-cd)
    nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>
    nmap <buffer> I <Plug>(fern-action-hidden-toggle)
    nmap <buffer> q :<C-u>quit<CR>
    nmap <buffer> <CR> <plug>(fern-action-open-or-expand)
  endfunction
  augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call s:init_fern()
  augroup END
]])
