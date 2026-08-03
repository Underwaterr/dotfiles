vim.lsp.config('pug', {
  cmd = { 'pug-lsp' },
  filetypes = { 'pug' },
  root_markers = { 'package.json' }
})

vim.lsp.enable('pug')
