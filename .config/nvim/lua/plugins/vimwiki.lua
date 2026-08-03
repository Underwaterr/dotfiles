vim.g.vimwiki_list = {
  { path = "~/apps/wiki/database/" }, 
  { path = "~/apps/wiki/morning-pages/" }
}

-- triggered when making a new diary page, `:VimwikiMakeDiaryNote`
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = vim.fn.expand("~") .. "/apps/wiki/diary/*.wiki",
  callback = function()
    vim.cmd("0r ~/apps/wiki/template")
    vim.cmd("%s/%date%/" .. os.date("%Y-%m-%d") .. "/ge")
  end,
})
