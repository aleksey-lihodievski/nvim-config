local prettier = require("prettier")

prettier.setup({
	bin = "prettier", -- or `prettierd`
	["null-ls"] = {
		runtime_condition = function(params)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	},
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})
