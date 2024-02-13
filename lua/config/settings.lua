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
set.foldcolumn = "1"

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

-- set.keymap = "russian-jcukenwin"
-- set.langmap =
-- 	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

local function escape(str)
	-- Эти символы должны быть экранированы, если встречаются в langmap
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

-- Наборы символов, введенных с зажатым шифтом
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
-- Наборы символов, введенных как есть
-- Здесь я не добавляю ',.' и 'бю', чтобы впоследствии не было рекурсивного вызова комманды
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
vim.opt.langmap = vim.fn.join({
	--  ; - разделитель, который не нужно экранировать
	--  |
	escape(ru_shift)
		.. ";"
		.. escape(en_shift),
	escape(ru) .. ";" .. escape(en),
}, ",")

-- set.listchars = {
-- 	tab = "| ",
-- }
-- set.list = true

-- set.autochdir = true
set.clipboard = "unnamedplus"

vim.cmd(":set noswapfile")
-- set.guitablabel = "%t"
vim.cmd(":syntax sync maxlines=200")
-- vim.opt.shortmess:append("c")
-- vim.opt.shortmess.set("c")
-- vim.opt.shortmess:append("c")
-- vim.opt.iskeyword:append("-")

-- folding
-- folding powered by treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter#folding
-- look for foldenable: https://github.com/neovim/neovim/blob/master/src/nvim/options.lua
-- Vim cheatsheet, look for folds keys: https://devhints.io/vim
-- vim.opt.foldmethod = "expr" -- default is "normal"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- default is ""

-- set.eob = " "
set.fillchars = {
	vert = "▕", -- alternatives │
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	-- foldsep = " ",
	foldclose = "▸",
}

local fc = vim.opt.fillchars:get()
local fn = vim.fn

-- set.fillchars = {
-- 	vert = "▕", -- alternatives │
-- 	fold = " ",
-- 	eob = " ", -- suppress ~ at EndOfBuffer
-- 	diff = "╱", -- alternatives = ⣿ ░ ─
-- 	msgsep = "‾",
-- 	foldopen = "v",
-- 	foldsep = "|",
-- 	foldclose = ">",
-- }

-- set.fillchars = "fold: ,foldopen:,foldclose:,foldsep:|"
-- set.fillchars.fold = " "
-- set.fillchars.foldopen = ""
-- set.fillchars.foldclose = ""
-- -- foldsep = " ", -- or "│" to use bar for show fold area
-- set.fillchars.foldsep = "| " -- or "│" to use bar for show fold area
-- },

local function get_fold(lnum)
	if fn.foldlevel(lnum) <= fn.foldlevel(lnum - 1) then
		return " "
	end
	return fn.foldclosed(lnum) == -1 and fc.foldopen or fc.foldclose
end

_G.get_statuscol = function()
	if vim.opt_local.signcolumn:get() == "yes" then
		return "%s%l%= " .. get_fold(vim.v.lnum) .. " "
	else
		return ""
	end
end

-- set.statuscolumn = "%!v:lua.get_statuscol()"

local function get_custom_foldtxt_suffix(foldstart)
	local fold_suffix_str = string.format("  %s [%s lines]", "┉", vim.v.foldend - foldstart + 1)

	return { fold_suffix_str, "Folded" }
end

local function get_custom_foldtext(foldtxt_suffix, foldstart)
	local line = vim.api.nvim_buf_get_lines(0, foldstart - 1, foldstart, false)[1]

	return {
		{ line, "Normal" },
		foldtxt_suffix,
	}
end

-- _G.get_foldtext = function()
-- 	local foldstart = vim.v.foldstart
-- 	local ts_foldtxt = vim.treesitter.foldtext()
-- 	local foldtxt_suffix = get_custom_foldtxt_suffix(foldstart)
--
-- 	if type(ts_foldtxt) == "string" then
-- 		return get_custom_foldtext(foldtxt_suffix, foldstart)
-- 	end
--
-- 	table.insert(ts_foldtxt, foldtxt_suffix)
-- 	return ts_foldtxt
-- end

---@module Foldtext
---Based on https://www.reddit.com/r/neovim/comments/16sqyjz/finally_we_can_have_highlighted_folds/
---Updated with vim.treesitter._fold.foldtext()

local function parse_line(linenr)
	local bufnr = vim.api.nvim_get_current_buf()

	local line = vim.api.nvim_buf_get_lines(bufnr, linenr - 1, linenr, false)[1]
	if not line then
		return nil
	end

	local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
	if not ok then
		return nil
	end

	local query = vim.treesitter.query.get(parser:lang(), "highlights")
	if not query then
		return nil
	end

	local tree = parser:parse({ linenr - 1, linenr })[1]

	local result = {}

	local line_pos = 0

	for id, node, metadata in query:iter_captures(tree:root(), 0, linenr - 1, linenr) do
		local name = query.captures[id]
		local start_row, start_col, end_row, end_col = node:range()

		local priority = tonumber(metadata.priority or vim.highlight.priorities.treesitter)

		if start_row == linenr - 1 and end_row == linenr - 1 then
			-- check for characters ignored by treesitter
			if start_col > line_pos then
				table.insert(result, {
					line:sub(line_pos + 1, start_col),
					{ { "Folded", priority } },
					range = { line_pos, start_col },
				})
			end
			line_pos = end_col

			local text = line:sub(start_col + 1, end_col)
			table.insert(result, { text, { { "@" .. name, priority } }, range = { start_col, end_col } })
		end
	end

	local i = 1
	while i <= #result do
		-- find first capture that is not in current range and apply highlights on the way
		local j = i + 1
		while j <= #result and result[j].range[1] >= result[i].range[1] and result[j].range[2] <= result[i].range[2] do
			for k, v in ipairs(result[i][2]) do
				if not vim.tbl_contains(result[j][2], v) then
					table.insert(result[j][2], k, v)
				end
			end
			j = j + 1
		end

		-- remove the parent capture if it is split into children
		if j > i + 1 then
			table.remove(result, i)
		else
			-- highlights need to be sorted by priority, on equal prio, the deeper nested capture (earlier
			-- in list) should be considered higher prio
			if #result[i][2] > 1 then
				table.sort(result[i][2], function(a, b)
					return a[2] < b[2]
				end)
			end

			result[i][2] = vim.tbl_map(function(tbl)
				return tbl[1]
			end, result[i][2])
			result[i] = { result[i][1], result[i][2] }

			i = i + 1
		end
	end

	return result
end

function HighlightedFoldtext()
	local result = parse_line(vim.v.foldstart)
	if not result then
		return vim.fn.foldtext()
	end

	local folded = {
		{ " ...", "FoldedIcon" },
		{ "+" .. vim.v.foldend - vim.v.foldstart .. " lines", "FoldedText" },
		{ "... ", "FoldedIcon" },
	}

	for _, item in ipairs(folded) do
		table.insert(result, item)
	end

	local result2 = parse_line(vim.v.foldend)
	if result2 then
		local first = result2[1]
		result2[1] = { vim.trim(first[1]), first[2] }
		for _, item in ipairs(result2) do
			table.insert(result, item)
		end
	end

	return result
end

local function set_fold_hl()
	local cl = vim.api.nvim_get_hl(0, { name = "CursorLineNr" })
	vim.api.nvim_set_hl(0, "FoldedIcon", { fg = cl.bg })
	vim.api.nvim_set_hl(0, "FoldedText", { bg = cl.bg, fg = cl.fg, italic = true })
end

-- set_fold_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_fold_hl,
})

-- return 'luaeval("HighlightedFoldtext")()'

-- vim.opt.foldtext = "v:lua.get_foldtext()"
vim.opt.foldtext = "v:lua.HighlightedFoldtext()"

vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.wo.foldtext = "nvim_treesitter#foldtext()"
-- vim.wo.fillchars = "fold: "
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1
vim.wo.foldlevel = 99
-- vim.wo.foldtext =
-- 	[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.foldenable = true
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
-- vim.opt.foldtext = "v:lua.get_foldtext()"
