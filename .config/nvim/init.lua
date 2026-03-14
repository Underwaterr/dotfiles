require('options')

require('plugins')
require('plugins.dracula')
require('plugins.telescope')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.mason')

require('plugins.ufo')
require('plugins.blink')
require('plugins.markview')
require('plugins.treesitter')

require('lsp.antlers')
require('lsp.astro')
require('lsp.jinja')
require('lsp.lua')
require('lsp.markdown')
require('lsp.postgres')
require('lsp.typescript')


-- LSP error messages
vim.diagnostic.config({
  virtual_text = false,       -- don't show inline text
  signs = false,              -- don't show symbols in the gutter
  underline = false,          -- don't underline relevant text
  update_in_insert = false,   -- don't update diagnostics while typing
  severity_sort = true        -- sort by severity
})
local function yeah()
  vim.diagnostic.open_float({ scope = 'line', focus_id = 'diagnostic_float' })
end
local function diag() vim.diagnostic.config({ underline = not vim.diagnostic.config().underline }) end
vim.keymap.set('n', '<CR>', yeah, { desc = "Toggle floating window" })
vim.keymap.set("n", "sd", diag, { desc = "Toggle underlining diagnostics" } )
vim.keymap.set("n", "sn", function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set("n", "sN", function() vim.diagnostic.jump({ count = -1 }) end)


-- linting
require('lint').linters_by_ft = {
  markdown = { 'markdownlint-cli2' },
  vimwiki = { 'markdownlint-cli2' }
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
  pattern = { '*.md', '*.wiki' },
  callback = function() require('lint').try_lint() end,
})


vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})


-- idk why I gotta set this explicity, but I do!
-- otherwise Markdown really, really wants tabs to be 4 spaces
vim.cmd('autocmd Filetype markdown setlocal shiftwidth=2')

vim.treesitter.language.register('markdown', 'vimwiki')
-- vim.g.markdown_fenced_languages = {'html', 'python', 'lua', 'vim', 'typescript', 'javascript'}
