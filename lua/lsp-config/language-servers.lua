-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions local opts = { noremap = true, silent = true }
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local disableFormatting = function(client, bufnr)
	--local params = util.make_formatting_params({})
	client.server_capabilities.documentFormattingProvider = false
	--client.request('textDocument/formatting', params, nil, bufnr)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- disableFormatting(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>

	----------------------------------------------
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	----------------------------------------------

	if client.server_capabilities.documentFormattingProvider then
		vim.cmd("nnoremap <silent><buffer> <Leader>fd :lua vim.lsp.buf.format()<CR>")
		-- format on save
		vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.cmd("xnoremap <silent><buffer> <Leader>df :lua vim.lsp.buf.range_formatting({})<CR>")
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	--vim.keymap.set('n', '<space>wl', function()
	--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "<space>df", vim.lsp.buf.formatting, bufopts)
end

--Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local util = require("vim.lsp.util")

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("lspconfig")["tsserver"].setup({
	-- on_attach = on_attach,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		disableFormatting(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
})

-- require("lspconfig").angularls.setup({})

-- require("lspconfig").graphql.setup({})

require("lspconfig").prismals.setup({})

-- require('lspconfig')['html'].setup{
--     on_attach = function(client, bufnr)
--       on_attach(client, bufnr)
--       disableFormatting(client, bufnr)
--     end,
--     capabilities = capabilities,
--     flags = lsp_flags,
-- }

require("lspconfig")["emmet_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
	flags = lsp_flags,
})

require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		disableFormatting(client, bufnr)
	end,
})

require("lspconfig").gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})

-- require("lspconfig").rust_analyzer.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- 	cmd = {
-- 		"rustup",
-- 		"run",
-- 		"stable",
-- 		"rust-analyzer",
-- 	},
-- })

require("lspconfig").astro.setup({})
