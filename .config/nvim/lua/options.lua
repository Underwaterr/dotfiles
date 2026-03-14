-- disable `netrw`
-- (do this early to avoid race conditions with `nvim-tree`)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- teeny tiny tabs
vim.o.tabstop = 2         -- tabs are two spaces wide
vim.o.shiftwidth = 2
vim.o.expandtab = true    -- convert tabs to spaces

-- word wrap
vim.o.wrap = true					-- lines longer than window width will wrap
vim.o.linebreak = true		-- wrap based on `breakat` characters

-- search case-sensitivity
vim.o.ignorecase = true   -- ignore case when searching
vim.o.smartcase = true    -- ignore "ignorecase" if search contains uppercase

-- Set relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- more misc. settings
vim.o.hlsearch = false      -- don't highlight text when searching
vim.o.confirm = true        -- Ask to save changes on quit
vim.o.autochdir = true      -- Automatically change working directory to current buffer
vim.o.scrolloff = 8         -- How many lines you see above and below cursor
vim.o.winborder = 'rounded' -- show windows with rounded corners
vim.o.showmode = false      -- hide the default "mode" since we show it in Lualine

-- set leader
vim.g.mapleader = ';'

-- spell check!
-- don't check for capitalization when doing spell check
vim.o.spellcapcheck = ""
vim.keymap.set('n', 'sp', ":set spell!<CR>")  -- run spell check with 'sp'
vim.keymap.set('n', 'sP', "1z=")              -- replace word with 'sP'

-- code folding
--set fillchars=fold:\
--" toggle folds with zz
vim.keymap.set('n', 'zz', "za")
-- turn on code folding (disabled because we are using UFO)
-- vim.o.foldmethod = 'indent'
-- set foldmethod=syntax
-- don't start w/ anything folded tho
vim.o.foldlevelstart = 99

-- Shift+Esc to enter Visual Block Mode
vim.keymap.set('n', '<S-Esc>', '<C-v>', { desc = 'Visual Block Mode' })

-- Use Postgres syntax for SQL files
vim.g.sql_type_default = 'pgsql'

-- turn off automatic comment insertion
vim.cmd('autocmd FileType * setlocal formatoptions-=cro')

-- splits
vim.o.splitright = true
vim.o.splitbelow = true
vim.keymap.set('n', 'ss', ":vnew<CR>")         -- split right
vim.keymap.set('n', 'sS', ":lefta vnew<CR>")   -- split left
vim.keymap.set('n', 'sv', ":new<CR>")          -- split below
vim.keymap.set('n', 'sh', "<C-w>h")            -- go to split left
vim.keymap.set('n', 'sk', "<C-w>k")            -- go to split above
vim.keymap.set('n', 'sj', "<C-w>j")            -- go to split below
vim.keymap.set('n', 'sl', "<C-w>l")            -- go to split right

-- tabs
vim.keymap.set('n', 'st', ":tabnew<CR>")        -- new tab
vim.keymap.set('n', '<Tab>', ":tabnext<CR>")   -- go to next tab
vim.keymap.set('n', '<S-Tab>', ":tabprev<CR>") -- go to previous tab

