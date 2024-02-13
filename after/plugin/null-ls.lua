local null_ls = require("null-ls")
--
local callback = function()
	vim.lsp.buf.format({ bufnr = bufnr })
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
	formatting.prettier,
	formatting.stylua,
	formatting.rustfmt, -- new rust
	formatting.black,
	-- formatting.solhint,
	-- formatting.eslint, starts working after first fail
	-- diagnostics.eslint,
	-- diagnostics.stylelint_lsp,
	-- formatting.tsserver,
	code_actions.gitsigns,

	completion.luasnip,

	diagnostics.luacheck,
	null_ls.builtins.code_actions.eslint,

	-- diagnostics.pylint.with({
	-- 	diagnostics_postprocess = function(diagnostic)
	-- 		diagnostic.code = diagnostic.message_id
	-- 	end,
	-- }),
}

null_ls.setup({
	-- you can reuse a shared lspconfig on_attach callback here
	debug = false,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = callback,
			})
		end
	end,
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
