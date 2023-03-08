require("nvim-tree").setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,

		show_on_dirs = true,
		-- here should be icons, this does not work

		icons = {
			-- error = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
			-- hint = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
			-- info = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
			-- warning = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
		},
		-- icons = {
		-- 	hint = "hint",
		-- 	info = "info",
		-- 	warning = "warn",
		-- 	error = "err",
		-- },
	},
})
