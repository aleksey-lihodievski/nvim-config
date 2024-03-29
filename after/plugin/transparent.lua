require("transparent").setup({
	groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		-- "CursorLineNr",
		"EndOfBuffer",
		"all",
	},

	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups

		-- example of akinsho/nvim-bufferline.lua
		-- "BufferLineTabClose",
		-- "BufferlineBufferSelected",
		-- "BufferLineFill",
		-- "BufferLineBackground",
		-- "BufferLineSeparator",
		-- "BufferLineIndicatorSelected",
		-- "all",

		"NvimTreeNormal", -- NvimTree
	},
	exclude_groups = {
		-- "NormalFloat",
		"CursorLineNr",
		"LineNr",
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptBorder",
		"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
	}, -- table: groups you don't want to clear
})

-- require("transparent").clear_prefix("BufferLine")
--
-- vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
--
-- -- vim.cmd([[hi Cursorline guibg=#212121 blend=100]])
-- vim.cmd([[hi Cursorline guibg=#212121]])
