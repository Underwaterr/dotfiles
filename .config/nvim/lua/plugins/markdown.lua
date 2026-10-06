require("render-markdown").setup({
  file_types = { 'markdown', 'vimwiki' },
  heading = {
    sign = false,
    width = 'block',
    position = 'inline'
  },
  pipe_table = {
    border_enabled = true,
    style = 'none'
  },
  bullet = { enabled = false }
})
