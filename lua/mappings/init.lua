local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> nvim-tree mappings <--
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
--> telescope mappings <--
--map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
--map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
--map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
--> barbar mappings <--
--map("n", "<A-,>", ":BufferPrevious<CR>", opts)
--map("n", "<A-.>", ":BufferNext<CR>", opts)

--Windows
map("n", "<leader>j", "<C-W>j<C-W><CR>", opts)
map("n", "<leader>k", "<C-W>k<C-W><CR>", opts)
map("n", "<leader>h", "<C-W>h<C-W><CR>", opts)
map("n", "<leader>l", "<C-W>l<C-W><CR>", opts)

--map("n", "H", "gT", opts)
--map("n", "L", "gt", opts)

--Reset search
map("n", ",<Space>", ":nohlsearch<CR>", opts)

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

--Telescope
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", opts)

-- Default for comments
-- gcc comment/uncomment current line, this does not take a count, if you want a count use the gc{count}{motion}
-- gc{motion} comment/uncomment selection defined by a motion (as lines are commented, any comment toggling actions will default to a linewise):
-- gcip comment/uncomment a paragraph
-- gc4w comment/uncomment current line
-- gc4j comment/uncomment 4 lines below the current line
-- dic delete comment block
-- gcic uncomment commented block

map("n", "<leader>gg", "<Cmd>:Neogit<CR>", opts)
map("n", "<leader>do", "<Cmd>:DiffviewOpen<CR>", opts)
map("n", "<leader>dc", "<Cmd>:DiffviewClose<CR>", opts)
map("n", "<leader>gl", "<Cmd>:Neogit log<CR>", opts)
map("n", "<leader>gp", "<Cmd>:Neogit push<CR>", opts)
-- "nnoremap <leader>gg :Neogit<cr>
-- nnoremap <leader>do :DiffviewOpen<cr>
-- nnoremap <leader>dc :DiffviewClose<cr>
-- "nnoremap <leader>gl :Neogit log<cr>
-- "nnoremap <leader>gp :Neogit push<cr>
