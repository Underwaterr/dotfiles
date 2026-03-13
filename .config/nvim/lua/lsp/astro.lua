vim.lsp.config('astro-ls', {
  cmd = { 'astro-ls', '--stdio' },
  filetypes = { 'astro' },
  root_markers = { 'package.json', 'tsconfig.json' },
})

vim.lsp.enable('astro-ls')
