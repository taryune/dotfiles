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
" auto reload
set autoread
au CursorHold * checktime
let g:tex_conceal=''
let g:indentLine_setConceal = 0

" Tab settings
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" Mappings
  nmap <F1> <Nop>
  nnoremap k -
  nnoremap j +
  nnoremap K k
  nnoremap J j

  " Split
  nnoremap s <Nop>
  nnoremap sj <C-w>j
  nnoremap sk <C-w>k
  nnoremap sl <C-w>l
  nnoremap sh <C-w>h
  nnoremap sv :<C-u>vs<CR>
  nnoremap sO <C-w>=
  nnoremap + :vertical resize +10<CR>
  nnoremap _ :vertical resize -10<CR>
  "Tab
  nnoremap st :<C-u>tabnew<CR>
  nnoremap sn gt
  nnoremap sp gT


" Lua
lua <<EOF
-- treesitter -----------------------------------------------------------
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
    }
  },
  indent = {
    enable = true,
  },
  ensure_installed = 'all'
}

-- lspconfig -----------------------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function ()
      require("rust-tools").setup {}
  end
}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


-- cmp -----------------------------------------------------------
-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- goto-preview -----------------------------------------------------------
require('goto-preview').setup {
  width = 120; -- Width of the floating window
  height = 15; -- Height of the floating window
  border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
  default_mappings = false; -- Bind default mappings
  debug = false; -- Print debug information
  opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
  resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
  post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
  -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
  references = { -- Configure the telescope UI for slowing the references cycling window.
    telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
  };
  focus_on_open = true; -- Focus the floating window when opening it.
  dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
  force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
  stack_floating_preview_windows = true, -- Whether to nest floating windows
  preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
}
-- Set up the mappings for goto-preview
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.keymap.set("n", "gq", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})


EOF


