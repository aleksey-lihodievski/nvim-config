require("barbar").setup({
	animation = true,
	closable = true,
	-- icon_separator_active = '',
	-- icon_separator_inactive = "",
	icons = {
		inactive = {
			separator = {
				left = "",
			},
		},
	},

	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- Use the default values: {event = 'BufWinLeave', text = nil}
		NvimTree = true,

		-- Or, specify the text used for the offset:
		-- undotree = { text = "undotree" },
		-- Or, specify the event which the sidebar executes when leaving:
		-- ["neo-tree"] = { event = "BufWipeout" },
		-- Or, specify both
		-- Outline = { event = "BufWinLeave", text = "symbols-outline" },
	},
})

vim.cmd("hi BufferTabpageFill ctermbg=black")
