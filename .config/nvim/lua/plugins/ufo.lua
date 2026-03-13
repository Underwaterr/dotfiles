require('ufo').setup({
  provider_selector = function()
    return {'treesitter', 'indent'}
  end
})

-- this doesn't work woooo
vim.keymap.set('n', 'zp', require("ufo.preview").peekFoldedLinesUnderCursor)
