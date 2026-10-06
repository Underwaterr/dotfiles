-- custom `Trash` command

vim.api.nvim_create_user_command('Trash', function()

  -- get current file
  local file = vim.fn.expand('%:p')
  if file == '' or vim.fn.filereadable(file) == 0 then
    vim.notify('No file on disk', vim.log.levels.WARN)
    return
  end

  -- prompt user to confirm deletion
  local choice = vim.fn.confirm('Trash ' .. file .. '?', '&Yes\n&No', 2)
  if choice ~= 1 then
    return
  end

  -- trash the file!
  vim.fn.system({ 'trash', file })

  if vim.v.shell_error ~= 0 then
    vim.notify('trash failed (exit ' .. vim.v.shell_error .. ')', vim.log.levels.ERROR)
    return
  end

  -- notify user file was trashed
  vim.notify('Trashed ' .. vim.fn.fnamemodify(file, ':t'), vim.log.levels.INFO)

  -- optional: remove the buffer, too
  -- vim.cmd('bdelete!')

end, { desc = 'Trash current file' })
