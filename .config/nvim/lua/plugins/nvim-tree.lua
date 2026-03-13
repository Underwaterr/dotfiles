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

