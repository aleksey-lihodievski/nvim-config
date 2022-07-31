local null_ls = require("null-ls")

local callback = function()
	vim.lsp.buf.formatting_sync()
end

local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
	formatting.prettier,
	formatting.stylua,
	formatting.eslint,
	-- formatting.stylelint_lsp,
	-- formatting.cssls
}

null_ls.setup({
	-- you can reuse a shared lspconfig on_attach callback here
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
