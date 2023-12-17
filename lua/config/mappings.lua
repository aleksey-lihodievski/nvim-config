local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

-- File tree
-- map("n", "<C-o>", ":lua require'nvim-tree-config'.toggle_tree()<CR>", opts)
map("n", "<C-o>", ":NvimTreeToggle<CR>", opts)

-- Transparency
map("n", "<leader>tt", ":TransparentToggle<CR>", opts)

--Windows
map("n", "<leader>j", "<C-W>j<C-W><CR>", opts)
map("n", "<leader>k", "<C-W>k<C-W><CR>", opts)
map("n", "<leader>h", "<C-W>h<C-W><CR>", opts)
map("n", "<leader>l", "<C-W>l<C-W><CR>", opts)

map("n", "=", [[<cmd>vertical resize +5<cr>]], opts) -- make the window biger vertically
map("n", "-", [[<cmd>vertical resize -5<cr>]], opts) -- make the window smaller vertically
map("n", "+", [[<cmd>horizontal resize +2<cr>]], opts) -- make the window bigger horizontally by pressing shift and =
map("n", "_", [[<cmd>horizontal resize -2<cr>]], opts) -- make the window smaller horizontally by pressing shift and -

--map("n", "H", "gT", opts)
--map("n", "L", "gt", opts)

--Reset search
map("n", ",<Space>", ":nohlsearch<CR>", opts)

--Esc
map("i", "jk", "<esc>", opts)

--Tabs
map("n", "<leader>tn", ":tabnew<CR>", opts)
-- Move to previous/next
map("n", "gp", "<Cmd>BufferPrevious<CR>", opts)
map("n", "gn", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "m<", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "m>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>0", "<Cmd>BufferLast<CR>", opts)

-- Close buffer
map("n", "gw", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>w", "<Cmd>BufferCloseAllButVisible<CR>", opts)

--Telescope
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", opts)

map("n", "<leader>gg", "<Cmd>:Neogit<CR>", opts)
map("n", "<leader>do", "<Cmd>:DiffviewOpen<CR>", opts)
map("n", "<leader>dc", "<Cmd>:DiffviewClose<CR>", opts)
map("n", "<leader>gl", "<Cmd>:Neogit log<CR>", opts)
map("n", "<leader>gp", "<Cmd>:Neogit push<CR>", opts)

map("n", "<leader><leader>", "<Cmd>:update<CR>", opts)
