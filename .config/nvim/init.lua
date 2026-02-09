-- set up Vim colors to work with the Kitty terminal
-- https://sw.kovidgoyal.net/kitty/faq/#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
vim.cmd('source ~/.config/nvim/kitty-colors.vim')

-- disable `netrw`
-- (do this early to avoid race conditions with `nvim-tree`)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- teeny tiny tabs
vim.o.tabstop = 2         -- tabs are two spaces wide
vim.o.shiftwidth = 2
vim.o.expandtab = true    -- convert tabs to spaces

-- word wrap
vim.o.wrap = true					-- lines longer than window width will wrap
vim.o.linebreak = true		-- wrap based on `breakat` characters

-- search case-sensitivity
vim.o.ignorecase = true   -- ignore case when searching
vim.o.smartcase = true    -- ignore "ignorecase" if search contains uppercase

-- Set relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- more misc. settings
vim.o.hlsearch = false      -- don't highlight text when searching
vim.o.confirm = true        -- Ask to save changes on quit
vim.o.autochdir = true      -- Automatically change working directory to current buffer
vim.o.scrolloff = 8         -- How many lines you see above and below cursor
vim.o.winborder = 'rounded' -- show windows with rounded corners
vim.o.showmode = false      -- hide the default "mode" since we show it in Lualine

-- spell check!
-- don't check for capitalization when doing spell check
vim.o.spellcapcheck = ""
vim.keymap.set('n', 'sp', ":set spell!<CR>")  -- run spell check with 'sp'
vim.keymap.set('n', 'sP', "z= 1 <CR> <CR>")   -- replace word with 'sP'

-- code folding
--set fillchars=fold:\
--" toggle folds with zz
vim.keymap.set('n', 'zz', "za")
-- turn on code folding
vim.o.foldmethod = 'indent'
-- set foldmethod=syntax
-- don't start w/ anything folded tho
vim.o.foldlevelstart = 99

-- Shift+Esc to enter Visual Block Mode
-- TODO: convert to Lua!
vim.cmd('nnoremap <S-ESC> <C-v>')

-- turn off automatic comment insertion
vim.cmd('autocmd FileType * setlocal formatoptions-=cro')

-- splits
vim.o.splitright = true
vim.o.splitbelow = true
vim.keymap.set('n', 'ss', ":vnew<CR>")         -- split right
vim.keymap.set('n', 'sS', ":lefta vnew<CR>")   -- split left
vim.keymap.set('n', 'sv', ":new<CR>")          -- split below
vim.keymap.set('n', 'sh', "<C-w>h")            -- go to split below
vim.keymap.set('n', 'sk', "<C-w>k")            -- go to split above
vim.keymap.set('n', 'sj', "<C-w>j")            -- go to split let
vim.keymap.set('n', 'sl', "<C-w>l")            -- go to split right

-- tabs
vim.keymap.set('n', 'st', ":tabnew<CR>")        -- new tab
vim.keymap.set('n', '<S-Tab>', ":tabprev<CR>") -- go to next tab
vim.keymap.set('n', '<Tab>', ":tabnext<CR>")   -- go to previous tab

-- Vim Plug stuff
local vim = vim
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
  Plug('vimwiki/vimwiki')                        -- VimWiki

  Plug('MeanderingProgrammer/render-markdown.nvim')
vim.call('plug#end')


-- use Dracula color scheme!
vim.cmd[[colorscheme dracula]]

-- Use Postgres syntax for SQL files
vim.cmd("let g:sql_type_default = 'pgsql'")

-- Telescope
local builtin = require('telescope.builtin')
vim.cmd("let g:mapleader=';'")
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' })

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
		theme = 'dracula',                  -- use Dracula theme!
		disabled_filetypes = { 'NvimTree' } -- don't show lualine in the file explorer!
	},
	sections = {
		lualine_a = { { 'mode', fmt = function(s) return mode_map[s] or s end } },
    lualine_b = { 'diff', 'diagnostics' },
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
    api.tree.toggle_hidden_filter()
    api.tree.toggle_custom_filter()
  end

  local function go_up()
    api.node.navigate.parent()
    api.tree.collapse_all()
    api.tree.change_root_to_parent()
  end

	vim.keymap.set('n', '<BS>', api.tree.close, 						  		opts('Close'))
	vim.keymap.set('n', '<CR>', api.node.open.edit,               opts('Open'))
	vim.keymap.set('n', '?', 		api.tree.toggle_help, 			  		opts('Help'))
	vim.keymap.set('n', 'R', 		api.tree.reload, 					        opts('Refresh'))
	vim.keymap.set('n', 'a', 		api.fs.create, 									  opts('Create'))
	vim.keymap.set('n', 'C',    api.fs.copy.node,                 opts('Copy'))
	vim.keymap.set('n', 'P',    api.fs.paste,                     opts('Paste'))
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
		dotfiles = true,
		git_ignored = true,
    custom = { ".git" }                   -- don't show `.git/` or `.gitignore`
	},
	actions = {
		open_file = {
			quit_on_open = true,                -- close when you open a file
			window_picker = { enable = false }  -- automatically open in last active buffer
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


-- LSP? for MY postgres??
vim.lsp.enable('postgres_lsp')
vim.lsp.config('postgres_lsp', {
  workspace_required = false
})

-- LSP for Antlers :)
vim.filetype.add({ pattern = { ['.*/*.antlers.html'] = 'antlers' } })
vim.lsp.enable('antlersls')

-- config for Lua LSP
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
	settings = {
		-- stop warning me about the `vim` global plz
		Lua = { diagnostics = { globals = { 'vim' } } }
	}
})

-- config for TypeScript LSP
vim.lsp.enable('typescript-tools')
require('typescript-tools').setup({})


-- Config for Blink autocomplete
require('blink.cmp').setup({
  fuzzy = {
    implementation = 'lua'
  },
  keymap = {
    preset = 'default',
    ['<Right>'] = { 'show', 'select_and_accept', 'fallback' },
    ['<Left>'] = { 'cancel', 'fallback' },
  },
  completion = {
    accept = { auto_brackets = { enabled = false } },
    documentation = { auto_show = true, auto_show_delay_ms = 0 },
    keyword = { range = 'prefix' },
    list = { selection = { preselect = false } },
    menu = { auto_show = false },
    --trigger = { show_on_backspace = true }
  },
})

-- config for UFO code folding
require('ufo').setup({
  provider_selector = function()
    return {'treesitter', 'indent'}
  end
})

-- this doesn't work woooo
vim.keymap.set('n', 'zp', require("ufo.preview").peekFoldedLinesUnderCursor)


-- config for Mason, LSP management
require("mason").setup({})


-- LSP error messages
vim.diagnostic.enable = true
vim.diagnostic.config({
  virtual_text = false,       -- don't show inline text
  signs = false,              -- don't show symbols in the gutter
  underline = false,          -- don't underline relevant text
  update_in_insert = false,   -- don't update diagnostics while typing
  severity_sort = true        -- sort by severity
})
local function yeah()
  vim.diagnostic.open_float({ scope = 'cursor' })
  vim.diagnostic.open_float() -- call a second time to enter
end
local function diag() vim.diagnostic.config({ underline = not vim.diagnostic.config().underline }) end
vim.keymap.set('n', '<CR>', yeah, { desc = "Toggle floating window" })
vim.keymap.set("n", "sd", diag, { desc = "Toggle underlining diagnostics" } )
vim.keymap.set("n", "sn", vim.diagnostic.goto_next)
vim.keymap.set("n", "sN", vim.diagnostic.goto_prev)


-- VimWiki
vim.g.vimwiki_list = {
  { path = "~/apps/vimwiki/database/" }, 
  { path = "~/apps/vimwiki/book/" }
}
-- stop Vimwiki from treating every markdown file as a wiki
vim.g.vimwiki_global_ext = 0 


-- idk why I gotta set this explicity, but I do!
vim.cmd('autocmd Filetype markdown setlocal shiftwidth=2')


-- more markdown stuff
require('render-markdown').setup({
  file_types = { 'markdown', 'vimwiki' }
})

-- TODO: fix this later
-- (running into GitHub server problems)
vim.treesitter.language.register('markdown', 'vimwiki')
vim.g.markdown_fenced_languages = {'html', 'python', 'lua', 'vim', 'typescript', 'javascript'}
