
-- LSP error messages
vim.diagnostic.config({
  virtual_text = false,       -- don't show inline text
  signs = false,              -- don't show symbols in the gutter
  underline = false,          -- don't underline relevant text
  update_in_insert = false,   -- don't update diagnostics while typing
  severity_sort = true        -- sort by severity
})


-- Use 'sd' to toggle showing diagnostics
local function toggle_underline()
  vim.diagnostic.config({ underline = not vim.diagnostic.config().underline })
end

vim.keymap.set('n', 'sd', toggle_underline, { desc = 'Toggle diagnostic underline' })

-- navigate through diagnostics with `sn` and `sN`
vim.keymap.set('n', 'sn', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
vim.keymap.set('n', 'sN', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Prev diagnostic' })


-- Use <CR> to show the diagnostics window
local function show_line_diagnostics()
  vim.diagnostic.open_float({ scope = 'line', focus_id = 'diagnostic_float' })
end

vim.keymap.set('n', '<CR>', show_line_diagnostics, { desc = 'Show line diagnostics' })

-- Don't overwrite <CR> for quickfix and location lists
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('qf_cr', { clear = true }),
  pattern = 'qf',
  callback = function(ev)
    vim.keymap.set('n', '<CR>', '<CR>', { buffer = ev.buf, remap = false })
  end,
})
