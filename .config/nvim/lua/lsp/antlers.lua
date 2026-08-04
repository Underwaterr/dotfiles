vim.lsp.config('antlersls', {
  cmd = { 'antlersls', '--stdio' },
  filetypes = { 'antlers' },
  root_markers = { 'composer.json' },
})

vim.lsp.enable('antlersls')
