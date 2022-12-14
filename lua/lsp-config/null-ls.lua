local null_ls = require("null-ls")
--
local callback = function()
	vim.lsp.buf.formatting_sync()
end

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
	formatting.prettier,
	formatting.stylua,
	-- formatting.eslint, starts working after first fail
	-- diagnostics.eslint,
	-- diagnostics.stylelint_lsp,
	-- formatting.tsserver,
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

-- local status_ok, null_ls = pcall(require, "null-ls")
-- if not status_ok then return end
-- null_ls.setup(astronvim.user_plugin_opts "plugins.null-ls")
--
