require('nvim-treesitter').install({
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
  'pug',
  'python',
  'rust',
  'sql',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'vue',
  'yaml'
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.wo[0][0].foldmethod = 'expr'
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end,
})
