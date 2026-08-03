require('nvim-treesitter').setup({
  ensure_installed = {
    'astro',
    'css',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'php',
    'python',
    'rust',
    'sql',
    'typescript',
    'tsx',
    'vim',
    'vimdoc',
    'vue',
    'yaml',
    'pug'
  }
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
