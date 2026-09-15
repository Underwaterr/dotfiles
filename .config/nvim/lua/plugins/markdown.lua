require("render-markdown").setup({
  file_types = { 'markdown', 'vimwiki' },
  heading = {
    sign = false,
    width = 'block',
    position = 'inline'
  },
  bullet = { enabled = false }
})
