require('blink.cmp').setup({
  enabled = function()
    local disabled_filetypes = { markdown = true, vimwiki = true }
    return not disabled_filetypes[vim.bo.filetype]
  end,
  fuzzy = {
    implementation = 'lua'
  },
  keymap = {
    preset = 'default',
    ['<Right>'] = { 'show', 'select_and_accept', 'fallback' },
    ['<Left>'] = { 'cancel', 'fallback' },
  },
  completion = {
    accept = { auto_brackets = { enabled = false } },
    documentation = { auto_show = true, auto_show_delay_ms = 0 },
    keyword = { range = 'prefix' },
    list = { selection = { preselect = false } },
    menu = { auto_show = false },
    --trigger = { show_on_backspace = true }
  },
})
