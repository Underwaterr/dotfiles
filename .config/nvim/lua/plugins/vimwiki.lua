vim.g.vimwiki_list = {
  { path = "~/apps/vimwiki/database/" }, 
  { path = "~/apps/vimwiki/book/" }
}

-- triggered when making a new diary page, `:VimwikiMakeDiaryNote`
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = vim.fn.expand("~") .. "/apps/vimwiki/diary/*.wiki",
  callback = function()
    vim.cmd("0r ~/apps/vimwiki/template")
    vim.cmd("%s/%date%/" .. os.date("%Y-%m-%d") .. "/ge")
  end,
})
