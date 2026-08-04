-- Help NeoVim recognize more obscure file types

vim.filetype.add({
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
  pattern = {
    ['.*%.antlers%.html'] = 'antlers',
  },
})
