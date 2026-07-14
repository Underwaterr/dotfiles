
-- shorten GitHub URLs
local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  gh('nvim-lua/plenary.nvim'),                    -- lua utilities (telescope dependency)
  gh('kevinhwang91/promise-async'),               -- ufo dependency
  gh('nvim-tree/nvim-web-devicons'),              -- nerd fonts
  gh('nvim-tree/nvim-tree.lua'),                  -- file explorer
  gh('Mofiqul/dracula.nvim'),                     -- dracula theme
  gh('nvim-lualine/lualine.nvim'),                -- status bar
  gh('nvim-telescope/telescope.nvim'),            -- file search
  gh('kevinhwang91/nvim-ufo'),                    -- code folding
  gh('mason-org/mason.nvim'),                     -- LSP management
  gh('saghen/blink.lib'),                         -- required by blink.cmp v2
  gh('saghen/blink.cmp'),                         -- autocomplete
  gh('lifepillar/pgsql.vim'),                     -- PostgreSQL syntax
  gh('vimwiki/vimwiki'),                          -- VimWiki
  gh('epwalsh/pomo.nvim'),                        -- pomodoro timer

  -- MARKDOWN!!
  gh('OXY2DEV/markview.nvim'),
  gh('mfussenegger/nvim-lint')
})
