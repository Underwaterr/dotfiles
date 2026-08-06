require('options')

require('plugins')
require('plugins.dracula')    -- color scheme
require('plugins.gitsigns')   -- git integration for buffers
require('plugins.lualine')    -- status bar
require('plugins.mason')      -- package manager
require('plugins.nvim-tree')  -- file explorer
require('plugins.treesitter') -- parsing!
require('plugins.vimwiki')    -- wiki

require('lsp.antlers')
require('lsp.astro')
require('lsp.jinja')
require('lsp.lua')
require('lsp.postgres')
require('lsp.pug')
require('lsp.terraform')
require('lsp.typescript')
require('lsp.vue')

require('diagnostics')
require('filetypes')
