
-- want to do some keymapping?
-- :help vim.keymap.set()


-- source our vimscript file
-- (path must be absolute)
vim.cmd('source ~/.config/nvim/config.vim')

-- disable `netrw`
-- (do this early to avoid race conditions with `nvim-tree`)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- teeny tiny tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- word wrap
vim.o.wrap = true					-- lines longer than window width will wrap
vim.o.linebreak = true		-- wrap based on `breakat` characters

-- ignore case when searching in lowercase
vim.o.smartcase = true
vim.o.ignorecase = true

-- don't highlight text when searching
vim.o.hlsearch = false

-- Ask to save changes on quit
vim.o.confirm = true

-- Automatically change working directory to current buffer
vim.o.autochdir = true

--" How many lines you see above and below cursor
-- set scrolloff=8
vim.o.scrolloff = 8

-- hide the default "mode" since we show it in Lualine
vim.o.showmode = false

-- Set relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- spell check!
-- don't check for capitalization when doing spell check
-- (run `:set spell` to enable Spell Check, `]s` to traverse)
vim.o.spellcapcheck = ""
vim.keymap.set('n', 'sp', ":set spell!<CR>")
vim.keymap.set('n', 'sP', "z= 1 <CR> <CR>")

-- code folding
--set fillchars=fold:\
--" toggle folds with zz
vim.keymap.set('n', 'zz', "za")
-- turn on code folding
vim.o.foldmethod = 'indent'
-- set foldmethod=syntax
-- don't start w/ anything folded tho
vim.o.foldlevelstart = 99


-- Vim Plug stuff
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug('nvim-lua/plenary.nvim')                 -- lua utilities
  Plug('kevinhwang91/promise-async')            -- lua utilities 
	Plug('nvim-tree/nvim-web-devicons')           -- nerd fonts
	Plug('nvim-tree/nvim-tree.lua')               -- file explorer
  Plug('neovim/nvim-lspconfig')                 -- LSP
  Plug('mfussenegger/nvim-dap')                 -- DAP
	Plug('dracula/vim', { ['as'] = 'dracula' })   -- theme
	Plug('nvim-lualine/lualine.nvim')             -- status bar
  Plug('nvim-telescope/telescope.nvim')         -- file search
  Plug('kevinhwang91/nvim-ufo')                 -- code folding
  Plug('mason-org/mason.nvim')                  -- LSP management
  --Plug('folke/trouble.nvim')                    -- LSP sidebars, etc 

vim.call('plug#end')


-- Dracula!
vim.cmd[[colorscheme dracula]]


-- Lualine
local mode_map = {
	['NORMAL'] 		= '🌙',
	['INSERT'] 		= '🧚',
	['REPLACE'] 	= '💁',
	['VISUAL'] 		= '👓',
	['V-LINE'] 		= '🕶️',
	['V-BLOCK'] 	= '🥽',
	['COMMAND'] 	= '✨',
	['TERMINAL'] 	= '🧠',
}

require('lualine').setup({
	options = {
		theme = 'dracula',
		-- don't show lualine in the file explorer!
		disabled_filetypes = { 'NvimTree' }
	},
	sections = {
		lualine_a = { { 'mode', fmt = function(s) return mode_map[s] or s end } },
		lualine_y = { 'filesize' }
	}
})


-- File Explorer
local function get_nvim_tree_mappings(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr, noremap = true, silent = true, nowait = true
		}
  end

  local function toggle_both_filters()
    api.tree.toggle_gitignore_filter()
    api.tree.toggle_custom_filter()
  end

  local function go_up()
    api.node.navigate.parent()
    api.tree.collapse_all()
    api.tree.change_root_to_parent()
  end

	vim.keymap.set('n', '<Bs>', api.tree.close, 						  		opts('Close'))
	vim.keymap.set('n', '<Cr>', api.node.open.edit, 				  		opts('Open'))
	vim.keymap.set('n', '?', 		api.tree.toggle_help, 			  		opts('Help'))
	vim.keymap.set('n', 'R', 		api.tree.reload, 					        opts('Refresh'))
	vim.keymap.set('n', 'a', 		api.fs.create, 									  opts('Create'))
	vim.keymap.set('n', 'c',    api.fs.copy.node,                 opts('Copy'))
	vim.keymap.set('n', 'd', 		api.fs.trash, 						  		  opts('Trash'))
	vim.keymap.set('n', 'h', 		toggle_both_filters,              opts('Toggle Hidden'))
	vim.keymap.set('n', 'm', 		api.fs.rename_full, 				  		opts('Move'))
	vim.keymap.set('n', 'p', 		api.node.open.preview, 			  		opts('Preview'))
	vim.keymap.set('n', 'r', 		api.fs.rename, 							  		opts('Rename'))
	vim.keymap.set('n', 'u', 		go_up,                            opts('Up'))
end

require("nvim-tree").setup({
  hijack_cursor = true,
  renderer = {
    add_trailing = true,
    hidden_display = 'simple',
    icons = { git_placement = 'signcolumn' }
  },
  trash = { cmd = 'trash' },
	update_focused_file = {
		enable = true,
		update_root = { enable = true },
	},
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	reload_on_bufenter = true,
	filters = {
		dotfiles = false,
		git_ignored = true,
    -- don't show `.git/` or `.gitignore`
    custom = { ".git" }
	},
	actions = {
		open_file = {
			-- close when you open a file
			quit_on_open = true,
			-- automatically open in last active buffer
			window_picker = { enable = false }
		}
	},
	on_attach = get_nvim_tree_mappings
})

-- use backspace to open file explorer
-- (backspace to close file explorer is defined under Nvim Tree key maps
vim.api.nvim_set_keymap("n", "<BS>", ":NvimTreeOpen<CR>", {noremap = true })


-- LSP stuff!!
-- get them from...
-- https://microsoft.github.io/language-server-protocol/implementors/servers/
-- UPDATE: now managed thru Mason
--vim.lsp.enable('biome')										-- JavaScript, TypeScript, etc
--vim.lsp.enable('marksman')								-- Markdown
--vim.lsp.enable('nginx_language_server')		-- Nginx
--vim.lsp.enable('rust_analyzer')						-- Rust
--vim.lsp.enable('vimls')										-- Vimscript
vim.lsp.enable('lua_ls')									  -- Lua
vim.lsp.enable('ts_ls')                     -- TypeScript


-- config for Lua LSP
vim.lsp.config('lua_ls', {
	settings = {
		-- stop warning me about the `vim` global plz
		Lua = { diagnostics = { globals = { 'vim' } } }
	}
})


-- config for UFO code folding
require('ufo').setup({
  provider_selector = function()
    return {'treesitter', 'indent'}
  end
})

vim.keymap.set('n', 'zp', require("ufo.preview").peekFoldedLinesUnderCursor)


-- config for Mason, LSP management
require("mason").setup({})


-- LSP error messages
vim.diagnostic.enable = true
vim.diagnostic.config({ virtual_lines = true })
local function yeah()
  vim.diagnostic.open_float({ scope = 'cursor', })
end
vim.keymap.set('n', 'S', yeah)
vim.o.winborder = 'rounded'
