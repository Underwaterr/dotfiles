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
