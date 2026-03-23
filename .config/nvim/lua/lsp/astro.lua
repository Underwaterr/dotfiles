vim.lsp.config('astro-ls', {
  cmd = { 'astro-ls', '--stdio' },
  filetypes = { 'astro' },
  root_markers = { 'package.json', 'tsconfig.json' },
  init_options = {
    typescript = {
      --tsdk = 'node_modules/typescript/lib'
      tsdk = vim.fn.getcwd() .. '/node_modules/typescript/lib'

    },
  },
})

vim.lsp.enable('astro-ls')
