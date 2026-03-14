vim.g.vimwiki_list = {
  { path = "~/apps/vimwiki/database/" }, 
  { path = "~/apps/vimwiki/book/" }
}
-- stop Vimwiki from treating every markdown file as a wiki
vim.g.vimwiki_global_ext = 0 


-- triggered when making a new diary page, `:VimwikiMakeDiaryNote`
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = vim.fn.expand("~") .. "/apps/vimwiki/diary/*.wiki",
  callback = function()
    vim.cmd("0r ~/apps/vimwiki/template")
    vim.cmd("%s/%date%/" .. os.date("%Y-%m-%d") .. "/ge")
  end,
})
