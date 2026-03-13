vim.lsp.config('lua_ls', {
	settings = {
		-- stop warning me about the `vim` global plz
		Lua = { diagnostics = { globals = { 'vim' } } }
	}
})

vim.lsp.enable('lua_ls')
