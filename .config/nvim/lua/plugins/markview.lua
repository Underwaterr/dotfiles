require('markview').setup({
  preview = {
    filetypes = { 'markdown', 'vimwiki' },
    icon_provider = 'devicons',
  },
  markdown = {
    headings = {
      heading_1 = { sign = false },
      heading_2 = { sign = false },
      heading_3 = { sign = false },
      heading_4 = { sign = false },
      heading_5 = { sign = false },
      heading_6 = { sign = false },
    },
  },
})
 
vim.keymap.set('n', '<leader>m', ':Markview<CR>', { desc = 'Toggle Markview' })
