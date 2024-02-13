require("barbar").setup({
	animation = false,
	closable = true,

	icons = {
		-- separator = { left = "|", right = "|" },

		-- inactive = {
		-- 	separator = {
		-- 		left = " ",
		-- 		right = " ",
		-- 	},
		-- },

		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
	},

	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		NvimTree = true,
	},
})

-- vim.cmd("hi BufferTabpageFill ctermbg=black")
