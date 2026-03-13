
-- Vim Plug stuff
local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug('nvim-lua/plenary.nvim')                 -- lua utilities
  Plug('kevinhwang91/promise-async')            -- lua utilities 
  Plug('nvim-tree/nvim-web-devicons')           -- nerd fonts
  Plug('nvim-tree/nvim-tree.lua')               -- file explorer
  -- Plug('neovim/nvim-lspconfig')              -- LSP
  Plug('mfussenegger/nvim-dap')                 -- DAP
  Plug('dracula/vim', { ['as'] = 'dracula' })   -- theme
  Plug('nvim-lualine/lualine.nvim')             -- status bar
  Plug('nvim-telescope/telescope.nvim')         -- file search
  Plug('kevinhwang91/nvim-ufo')                 -- code folding
  Plug('mason-org/mason.nvim')                  -- LSP management
  --Plug('folke/trouble.nvim')                  -- LSP sidebars, etc 
  Plug('pmizio/typescript-tools.nvim')          -- TypeScript LSP, not on Mason
  Plug('saghen/blink.cmp')                      -- autocomplete 😱
  Plug('lifepillar/pgsql.vim')                  -- uPostgreSQL
  Plug('vimwiki/vimwiki')                       -- VimWiki

  -- MARKDOWN!!
  Plug('OXY2DEV/markview.nvim')
  Plug('mfussenegger/nvim-lint')
  
vim.call('plug#end')
