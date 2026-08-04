-- Mason prepends `~/.local/share/nvim/mason/bin` to Neovim's PATH
-- this is how the bare cmd names in the LSP files resolve without absolute paths
-- Servers installed outside Mason need to be on the shell PATH independently
require("mason").setup({})
