vim.lsp.config('vue_ls', {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'vue' },
  init_options = { vue = { hybridMode = true } }
})

vim.lsp.enable('vue_ls')
