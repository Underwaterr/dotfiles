require('trouble').setup({})

vim.keymap.set('n', '<leader>d', ':Trouble diagnostics toggle<CR>', { desc = 'Toggle Trouble diagnostics' })
