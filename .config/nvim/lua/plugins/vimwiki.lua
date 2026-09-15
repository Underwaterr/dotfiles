
local default_wiki = { { path = "~/vimwiki/" } }

local wikis_by_host = {
  ["rocky"] = {
    { path = "~/Code/wiki/" }
  },
  ["garfield-solutions"] = {
    { path = "~/apps/wiki/database/" }, 
    { path = "~/apps/wiki/commonplace/" },
    { path = "~/apps/wiki/story/" }
  }
}

-- Get the computer HOSTNAME
-- stripping any domain suffix, e.g. "mbp.local"
local hostname = vim.fn.hostname():match("^[^.]+")  

vim.g.vimwiki_list = wikis_by_host[hostname] or default_wikis


-- triggered when making a new diary page, `:VimwikiMakeDiaryNote`
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = vim.fn.expand("~") .. "/apps/wiki/diary/*.wiki",
  callback = function()
    vim.cmd("0r ~/apps/wiki/template")
    vim.cmd("%s/%date%/" .. os.date("%Y-%m-%d") .. "/ge")
  end,
})

vim.treesitter.language.register('markdown', 'vimwiki')
