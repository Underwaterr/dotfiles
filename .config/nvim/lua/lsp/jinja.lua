vim.lsp.config('jinja_lsp', {
  cmd = { 'jinja-lsp' },
  filetypes = { 'jinja' },
  root_markers = { 'pyproject.toml', 'jinja-lsp.toml' },
})

vim.lsp.enable('jinja_lsp')
