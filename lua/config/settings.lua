local set = vim.opt

vim.g.mapleader = " "
set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.mouse = "a"
set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 7
set.fileencoding = "utf-8"
set.conceallevel = 2
set.textwidth = 0

set.relativenumber = true
set.number = true
set.cursorline = true
-- set.cursorcolumn = true
set.wildmenu = true
set.completeopt = "menu,menuone"
set.complete = ""
set.cc = "80" --set an 80 column border for good coding style

set.hidden = true
set.mouse = "v" --middle-click paste with
set.mouse = "a"

-- set.autochdir = true
set.clipboard = "unnamedplus"

vim.cmd(":set noswapfile")
-- set.guitablabel = "%t"
vim.cmd(":syntax sync maxlines=200")
-- vim.opt.shortmess:append("c")
-- vim.opt.shortmess.set("c")
-- vim.opt.shortmess:append("c")
-- vim.opt.iskeyword:append("-")
