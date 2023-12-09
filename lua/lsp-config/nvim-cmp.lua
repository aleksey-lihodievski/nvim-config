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

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	window = {
		documentation = cmp.config.window.bordered(),
	},

	-- may be turned off
	completion = {
		-- autocomplete = false,
		completeopt = "menu,menuone,noselect", -- preview
	},

	opts = function(_, opts)
		-- opts parameter is the default options table
		-- the function is lazy loaded so cmp is able to be required
		local cmp = require("cmp")
		-- modify the sources part of the options table
		opts.sources = cmp.config.sources({
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
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),

		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),

		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		["<C-f>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-b>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	local col = vim.fn.col(".") - 1
		--
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item(select_opts)
		-- 	elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		-- 		fallback()
		-- 	else
		-- 		cmp.complete()
		-- 	end
		-- end, { "i", "s" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item(select_opts)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},

	-- mapping = cmp.mapping.preset.insert({
	-- 	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	-- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 	["<C-Space>"] = cmp.mapping.complete(),
	-- 	["<CR>"] = cmp.mapping.confirm({
	-- 		behavior = cmp.ConfirmBehavior.Replace,
	-- 		select = true,
	-- 	}),
	--
	-- 	-- ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
	-- 	--
	-- 	-- ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
	--
	-- 	-- ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
	-- 	-- ["<Down>"] = cmp.mapping.select_next_item(select_opts),
	--
	-- 	-- ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
	-- 	-- ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
	-- 	--
	-- 	-- -- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
	-- 	-- -- ["<C-d>"] = cmp.mapping.scroll_docs(4),
	-- 	--
	-- 	-- ["<C-e>"] = cmp.mapping.abort(),
	-- 	--
	-- 	-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
	-- 	-- ["<CR>"] = cmp.mapping.confirm({ select = false }),
	-- 	--
	-- 	-- ["<C-f>"] = cmp.mapping(function(fallback)
	-- 	-- 	if luasnip.jumpable(1) then
	-- 	-- 		luasnip.jump(1)
	-- 	-- 	else
	-- 	-- 		fallback()
	-- 	-- 	end
	-- 	-- end, { "i", "s" }),
	--
	-- 	-- ["<C-b>"] = cmp.mapping(function(fallback)
	-- 	-- 	if luasnip.jumpable(-1) then
	-- 	-- 		luasnip.jump(-1)
	-- 	-- 	else
	-- 	-- 		fallback()
	-- 	-- 	end
	-- 	-- end, { "i", "s" }),
	-- }),

	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },

		-- { name = "nvim_lsp" },
		-- -- { name = "luasnip" },
		-- { name = "buffer" },
		-- { name = "path" },
	},

	formatting = {
		format = function(entry, item)
			item.kind = lsp_symbols[item.kind]
			item.menu = ({
				-- buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				neorg = "[Neorg]",
				-- text = "[Text]",
			})[entry.source.name]

			return item
		end,
	},
})

-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
-- 	return
-- end
--
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
-- 	return
-- end
--
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
--
-- require("luasnip/loaders/from_vscode").lazy_load()
--
-- local check_backspace = function()
-- 	local col = vim.fn.col(".") - 1
-- 	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end
--
-- local kind_icons = {
-- 	Text = "󰉿",
-- 	Method = "󰆧",
-- 	Function = "󰊕",
-- 	Constructor = "",
-- 	Field = " ",
-- 	Variable = "󰀫",
-- 	Class = "󰠱",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "󰜢",
-- 	Unit = "󰑭",
-- 	Value = "󰎠",
-- 	Enum = "",
-- 	Keyword = "󰌋",
-- 	Snippet = "",
-- 	Color = "󰏘",
-- 	File = "󰈙",
-- 	Reference = "",
-- 	Folder = "󰉋",
-- 	EnumMember = "",
-- 	Constant = "󰏿",
-- 	Struct = "",
-- 	Event = "",
-- 	Operator = "󰆕",
-- 	TypeParameter = " ",
-- 	Misc = " ",
-- }
-- -- find more here: https://www.nerdfonts.com/cheat-sheet
--
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body) -- For `luasnip` users.
-- 		end,
-- 	},
-- 	mapping = {
-- 		["<C-k>"] = cmp.mapping.select_prev_item(),
-- 		["<C-j>"] = cmp.mapping.select_next_item(),
-- 		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
-- 		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
-- 		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
-- 		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
-- 		["<C-e>"] = cmp.mapping({
-- 			i = cmp.mapping.abort(),
-- 			c = cmp.mapping.close(),
-- 		}),
-- 		-- Accept currently selected item. If none selected, `select` first item.
-- 		-- Set `select` to `false` to only confirm explicitly selected items.
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 		-- ["<Tab>"] = cmp.mapping(function(fallback)
-- 		-- 	if cmp.visible() then
-- 		-- 		cmp.select_next_item()
-- 		-- 	elseif luasnip.expandable() then
-- 		-- 		luasnip.expand()
-- 		-- 	elseif luasnip.expand_or_jumpable() then
-- 		-- 		luasnip.expand_or_jump()
-- 		-- 	elseif check_backspace() then
-- 		-- 		fallback()
-- 		-- 	else
-- 		-- 		fallback()
-- 		-- 	end
-- 		-- end, {
-- 		-- 	"i",
-- 		-- 	"s",
-- 		-- }),
-- 		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
-- 		-- 	if cmp.visible() then
-- 		-- 		cmp.select_prev_item()
-- 		-- 	elseif luasnip.jumpable(-1) then
-- 		-- 		luasnip.jump(-1)
-- 		-- 	else
-- 		-- 		fallback()
-- 		-- 	end
-- 		-- end, {
-- 		-- 	"i",
-- 		-- 	"s",
-- 		-- }),
-- 	},
--
-- 	formatting = {
-- 		format = function(entry, item)
-- 			item.kind = lsp_symbols[item.kind]
-- 			item.menu = ({
-- 				buffer = "[Buffer]",
-- 				nvim_lsp = "[LSP]",
-- 				luasnip = "[Snippet]",
-- 				neorg = "[Neorg]",
-- 			})[entry.source.name]
--
-- 			return item
-- 		end,
-- 	},
--
-- 	-- formatting = {
-- 	-- 	fields = { "kind", "abbr", "menu" },
-- 	-- 	format = function(entry, vim_item)
-- 	-- 		-- Kind icons
-- 	-- 		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
-- 	-- 		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
-- 	-- 		vim_item.menu = ({
-- 	-- 			nvim_lsp = "[LSP]",
-- 	-- 			luasnip = "[Snippet]",
-- 	-- 			buffer = "[Buffer]",
-- 	-- 			path = "[Path]",
-- 	-- 		})[entry.source.name]
-- 	-- 		return vim_item
-- 	-- 	end,
-- 	-- },
--
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 		{ name = "luasnip" },
-- 		{ name = "buffer" },
-- 		{ name = "path" },
-- 	},
-- 	confirm_opts = {
-- 		behavior = cmp.ConfirmBehavior.Replace,
-- 		select = false,
-- 	},
-- 	window = {
-- 		documentation = {
-- 			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
-- 		},
-- 	},
-- 	experimental = {
-- 		ghost_text = false,
-- 		native_menu = false,
-- 	},
-- })

-- local cmp = require("cmp")
-- -- if not cmp then
-- -- 	return
-- -- end
--
-- local luasnip = require("luasnip")
-- -- if not luasnip then
-- -- 	return
-- -- end
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
--
-- cmp.setup({
-- 	opts = function(_, opts)
-- 		-- opts parameter is the default options table
-- 		-- the function is lazy loaded so cmp is able to be required
-- 		local cmp = require("cmp")
-- 		-- modify the sources part of the options table
-- 		opts.sources = cmp.config.sources({
-- 			{ name = "nvim_lsp", priority = 1000 },
-- 			{ name = "luasnip", priority = 750 },
-- 			{ name = "buffer", priority = 500 },
-- 			{ name = "path", priority = 250 },
-- 			{ name = "vim-dadbod-completion", priority = 700 }, -- add new source
-- 		})
-- 		-- return the new table to be used
-- 		return opts
-- 	end,
--
-- 	sources = {
-- 		-- { name = "buffer" },
-- 		{ name = "nvim_lsp" },
-- 		{ name = "luasnip" },
-- 		-- { name = "neorg" },
-- 	},
-- 	mapping = {
-- 		["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<CR>"] = cmp.mapping.confirm({
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = true,
-- 		}),
-- 		-- ["<s-tab>"] = cmp.mapping.select_prev_item(),
-- 		-- ["<tab>"] = cmp.mapping.select_next_item(),
-- 	},
-- 	-- formatting = {
-- 	-- 	format = function(entry, item)
-- 	-- 		item.kind = lsp_symbols[item.kind]
-- 	-- 		item.menu = ({
-- 	-- 			buffer = "[Buffer]",
-- 	-- 			nvim_lsp = "[LSP]",
-- 	-- 			luasnip = "[Snippet]",
-- 	-- 			neorg = "[Neorg]",
-- 	-- 		})[entry.source.name]
-- 	--
-- 	-- 		return item
-- 	-- 	end,
-- 	-- },
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body)
-- 		end,
-- 	},
-- })
-- u
