-- local lsp_symbols = {
-- 	Text = "   (Text) ",
-- 	Method = "   (Method)",
-- 	Function = "   (Function)",
-- 	Constructor = "   (Constructor)",
-- 	Field = " ﴲ  (Field)",
-- 	Variable = "[] (Variable)",
-- 	Class = "   (Class)",
-- 	Interface = " ﰮ  (Interface)",
-- 	Module = "   (Module)",
-- 	Property = " 襁 (Property)",
-- 	Unit = "   (Unit)",
-- 	Value = "   (Value)",
-- 	Enum = " 練 (Enum)",
-- 	Keyword = "   (Keyword)",
-- 	Snippet = "   (Snippet)",
-- 	Color = "   (Color)",
-- 	File = "   (File)",
-- 	Reference = "   (Reference)",
-- 	Folder = "   (Folder)",
-- 	EnumMember = "   (EnumMember)",
-- 	Constant = " ﲀ  (Constant)",
-- 	Struct = " ﳤ  (Struct)",
-- 	Event = "   (Event)",
-- 	Operator = "   (Operator)",
-- 	TypeParameter = "   (TypeParameter)",
-- }
local lsp_symbols = {
	Text = "   ",
	Method = "   ",
	Function = "   ",
	Constructor = "   ",
	Field = " ﴲ  ",
	Variable = "[] ",
	Class = "   ",
	Interface = " ﰮ  ",
	Module = "   ",
	Property = " 襁 ",
	Unit = "   ",
	Value = "   ",
	Enum = " 練 ",
	Keyword = "   ",
	Snippet = "   ",
	Color = "   ",
	File = "   ",
	Reference = "   ",
	Folder = "   ",
	EnumMember = "   ",
	Constant = " ﲀ  ",
	Struct = " ﳤ  ",
	Event = "   ",
	Operator = "   ",
	TypeParameter = "   ",
}

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").load() -- loads snippets

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

	snippet = {
		expand = function(args)
			-- vim.fn["UltiSnips#Anon"](args.body)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = {

		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),

		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),

		-- TODO: resolve with c-n and c-p
		["<C-c>"] = cmp.mapping.complete(),

		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},

	sources = {
		{ name = "luasnip", keyword_length = 2 },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "path", keyword_length = 1 },
		{ name = "buffer", keyword_length = 3 },
	},

	-- { name = "path", priority = 250 },
	-- { name = "vim-dadbod-completion", priority = 700 }, -- add new source

	formatting = {
		-- fields = { "abbr", "kind", "menu" },
		fields = { "kind", "abbr" },

		format = function(entry, item)
			item.kind = lsp_symbols[item.kind]
			-- item.menu = ({
			-- 	buffer = "[Buffer]",
			-- 	path = "[Path]",
			-- 	nvim_lsp = "[LSP]",
			-- 	-- ultisnips = "[Snippet]",
			-- 	-- luasnip = "[Snippet]",
			-- 	neorg = "[Neorg]",
			-- 	-- text = "[Text]",
			-- })[entry.source.name]

			-- removes duplicate snippets (duplicates from lsp will disappear)
			item.dup = ({
				luasnip = 0,
				nvim_lsp = 0,

				-- vsnip = 0,
				-- nvim_lsp = 0,
				-- nvim_lua = 0,
				-- buffer = 0,
			})[entry.source.name] or 0

			return item
		end,
	},
})
