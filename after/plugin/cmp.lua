-- local lsp_zero = require('lsp-zero')
--
-- lsp_zero.on_attach(function(client, bufnr)
--   -- see :help lsp-zero-keybindings
--   -- to learn the available actions
--   lsp_zero.default_keymaps({buffer = bufnr})
--   lsp_zero.buffer_autoformat()
-- end)
--
-- lsp_zero.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     -- formatting.prettier,
--     -- formatting.stylua,
--     -- formatting.rustfmt,
--     -- formatting.black,
--
--     ['tsserver'] = {'javascript', 'typescript'},
--     -- ['prettier'] = {'javascript', 'typescript'},
--     ['stylua'] = {"lua"},
--     ['black'] = {"python"},
--     ['rustfmt'] = {'rust'},
--   }
-- })
--
-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions local opts = { noremap = true, silent = true }
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
--
-- local disableFormatting = function(client, bufnr)
-- 	--local params = util.make_formatting_params({})
-- 	client.server_capabilities.documentFormattingProvider = false
-- 	--client.request('textDocument/formatting', params, nil, bufnr)
-- end
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- 	if client.server_capabilities.documentFormattingProvider then
-- 		vim.cmd("nnoremap <silent><buffer> <Leader>fd :lua vim.lsp.buf.format()<CR>")
-- 		-- format on save
-- 		vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
-- 	end
--
-- 	if client.server_capabilities.documentFormattingProvider then
-- 		vim.cmd("xnoremap <silent><buffer> <Leader>df :lua vim.lsp.buf.range_formatting({})<CR>")
-- 	end
--
-- 	-- Mappings.
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 	local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- 	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
-- 	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
-- 	--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- 	--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- 	--vim.keymap.set('n', '<space>wl', function()
-- 	--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 	--end, bufopts)
-- 	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
-- 	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
-- 	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
-- 	-- vim.keymap.set("n", "<space>df", vim.lsp.buf.formatting, bufopts)
-- end
--
-- --Add additional capabilities supported by nvim-cmp
-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- local util = require("vim.lsp.util")
--
-- local lsp_flags = {
-- 	-- This is the default in Nvim 0.7+
-- 	debounce_text_changes = 150,
-- }
--
-- require("lspconfig")["tsserver"].setup({
-- 	-- on_attach = on_attach,
-- 	on_attach = function(client, bufnr)
-- 		on_attach(client, bufnr)
-- 		disableFormatting(client, bufnr)
-- 	end,
-- 	capabilities = capabilities,
-- 	flags = lsp_flags,
-- })
--
-- -- require("lspconfig").angularls.setup({})
--
-- -- require("lspconfig").graphql.setup({})
--
-- require("lspconfig").prismals.setup({})
--
-- -- require('lspconfig')['html'].setup{
-- --     on_attach = function(client, bufnr)
-- --       on_attach(client, bufnr)
-- --       disableFormatting(client, bufnr)
-- --     end,
-- --     capabilities = capabilities,
-- --     flags = lsp_flags,
-- -- }
--
-- require("lspconfig")["emmet_ls"].setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
-- 	init_options = {
-- 		html = {
-- 			options = {
-- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
-- 				["bem.enabled"] = true,
-- 			},
-- 		},
-- 	},
-- 	flags = lsp_flags,
-- })
--
-- require("lspconfig").eslint.setup({
-- 	on_attach = function(client, bufnr)
-- 		on_attach(client, bufnr)
-- 		disableFormatting(client, bufnr)
-- 	end,
-- })
--
-- require("lspconfig").gopls.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
--
-- require("lspconfig").pyright.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	flags = lsp_flags,
-- })
--
-- -- require("lspconfig").rust_analyzer.setup({
-- -- 	capabilities = capabilities,
-- -- 	on_attach = on_attach,
-- -- 	flags = lsp_flags,
-- -- 	cmd = {
-- -- 		"rustup",
-- -- 		"run",
-- -- 		"stable",
-- -- 		"rust-analyzer",
-- -- 	},
-- -- })
--
-- require("lspconfig").astro.setup({})
--
-- -- Cmp setup -------------------------------------------------------------------
--
local lsp_symbols = {
	Text = "   (Text) ",
	Method = "   (Method)",
	Function = "   (Function)",
	Constructor = "   (Constructor)",
	Field = " ﴲ  (Field)",
	Variable = "[] (Variable)",
	Class = "   (Class)",
	Interface = " ﰮ  (Interface)",
	Module = "   (Module)",
	Property = " 襁 (Property)",
	Unit = "   (Unit)",
	Value = "   (Value)",
	Enum = " 練 (Enum)",
	Keyword = "   (Keyword)",
	Snippet = "   (Snippet)",
	Color = "   (Color)",
	File = "   (File)",
	Reference = "   (Reference)",
	Folder = "   (Folder)",
	EnumMember = "   (EnumMember)",
	Constant = " ﲀ  (Constant)",
	Struct = " ﳤ  (Struct)",
	Event = "   (Event)",
	Operator = "   (Operator)",
	TypeParameter = "   (TypeParameter)",
}

local cmp = require("cmp")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
-- local cmp_action = require("lsp-zero").cmp_action()

-- local luasnip = require("luasnip")

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),

		-- documentation = {
		-- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		-- },

		-- documentation = cmp.config.window.bordered(),
	},

	-- may be turned off
	completion = {
		completeopt = "menu,menuone,noinsert",
		autocomplete = { cmp.TriggerEvent.InsertEnter, cmp.TriggerEvent.TextChanged },
		-- autocomplete = true,
	},

	opts = function(_, opts)
		-- opts parameter is the default options table
		-- the function is lazy loaded so cmp is able to be required
		local cmp = require("cmp")
		-- modify the sources part of the options table
		opts.sources = cmp.config.sources({
			{ name = "ultisnips", priority = 2000 },
			{ name = "nvim_lsp", priority = 1000 },
			-- { name = "luasnip", priority = 750 },
			{ name = "buffer", priority = 500 },
			{ name = "path", priority = 250 },
			{ name = "vim-dadbod-completion", priority = 700 }, -- add new source
		})
		-- return the new table to be used
		return opts
	end,

	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
			-- luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {

		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),

		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),

		-- ["<C-n>"] = cmp.mapping(function(fallback)
		-- 	cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
		-- end, {
		-- 	"i",
		-- 	"s",
		-- 	"c", --[[ "c" (to enable the mapping in command mode) ]]
		-- }),
		-- ["<C-p>"] = cmp.mapping(function(fallback)
		-- 	cmp_ultisnips_mappings.jump_backwards(fallback)
		-- end, {
		-- 	"i",
		-- 	"s",
		-- 	"c", --[[ "c" (to enable the mapping in command mode) ]]
		-- }),

		-- ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		-- ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),

		-- TODO: resolve with c-n and c-p
		["<C-c>"] = cmp.mapping.complete(),

		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		--
		-- 	-- ["<C-x><C-o>"] = vim.cmd("<Cmd>lua require('cmp').complete()<CR>"),

		-- ["<C-f>"] = cmp.mapping(function(fallback)
		-- 	if luasnip.jumpable(1) then
		-- 		luasnip.jump(1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<C-b>"] = cmp.mapping(function(fallback)
		-- 	if luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},

	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},

	formatting = {
		fields = { "abbr", "kind", "menu" },

		format = function(entry, item)
			item.kind = lsp_symbols[item.kind]
			item.menu = ({
				buffer = "[Buffer]",
				path = "[Path]",
				nvim_lsp = "[LSP]",
				ultisnips = "[Snippet]",
				neorg = "[Neorg]",
				-- text = "[Text]",
			})[entry.source.name]

			return item
		end,
	},
})
