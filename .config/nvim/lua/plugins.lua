-- shorten GitHub URLs
local gh = function(x) return 'https://github.com/' .. x end

-- VimWiki settings
-- (must be set before `vim.pack.add` sources the plugin)
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {
  { path = '~/apps/wiki/database/' },
  { path = '~/apps/wiki/morning-pages/' },
}

vim.pack.add({
  gh('neovim/nvim-lspconfig'),                      -- LSP server definitions
  gh('nvim-treesitter/nvim-treesitter'),            -- parsers + queries
  gh('nvim-tree/nvim-web-devicons'),                -- nerd fonts
  gh('nvim-tree/nvim-tree.lua'),                    -- file explorer
  gh('Mofiqul/dracula.nvim'),                       -- dracula theme
  gh('nvim-lualine/lualine.nvim'),                  -- status bar
  gh('mason-org/mason.nvim'),                       -- package manager 
  gh('WhoIsSethDaniel/mason-tool-installer.nvim'),  -- package manager manager
  gh('lifepillar/pgsql.vim'),                       -- PostgreSQL syntax
  gh('vimwiki/vimwiki'),                            -- VimWiki
  gh('lewis6991/gitsigns.nvim'),                    -- git buffer integration
  gh('OXY2DEV/markview.nvim'),                      -- rendering markdown
})
