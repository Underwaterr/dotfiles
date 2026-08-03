local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug('nvim-tree/nvim-web-devicons')           -- nerd fonts
  Plug('nvim-tree/nvim-tree.lua')               -- file explorer
  Plug('dracula/vim', { ['as'] = 'dracula' })   -- theme
  Plug('nvim-lualine/lualine.nvim')             -- status bar
  Plug('mason-org/mason.nvim')                  -- LSP management
  Plug('lifepillar/pgsql.vim')                  -- PostgreSQL
  Plug('vimwiki/vimwiki')                       -- VimWiki
  Plug('epwalsh/pomo.nvim')			                -- pomodoro timer
  Plug('folke/trouble.nvim')                    -- diagnostic tool
  Plug('pmizio/typescript-tools.nvim')          -- TypeScript LPS cuz Mason didn't have it

  -- Treesitter
  -- (will be obsolete once the native treesitter can load parsers
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

  -- stop Vimwiki from treating every markdown file as a wiki
  vim.g.vimwiki_global_ext = 0 

vim.call('plug#end')
