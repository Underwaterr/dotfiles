local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' })
