vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Themes -------------------------------------------------------------------
	use("tiagovla/tokyodark.nvim")
	use("sainnhe/sonokai")
	use("drazil100/dusklight.vim") -- nice
	use("nyoom-engineering/oxocarbon.nvim")
	use("nxvu699134/vn-night.nvim")
	use("jsit/toast.vim") -- nice but props not so readable
	use("nikolvs/vim-sunbather") -- impressive!
	use("sainnhe/edge")
	use("dracula/vim")
	use("folke/tokyonight.nvim")
	use("rakr/vim-one")
	use("mhartington/oceanic-next")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("rebelot/kanagawa.nvim")
	use({ "Everblush/everblush.nvim", as = "everblush" })
	use("maximumtiu/true.vim") -- nice but props not so readable
	use("navarasu/onedark.nvim")
	-- use("LunarVim/primer.nvim")
	-- use("olimorris/onedarkpro.nvim") -- very nice onedark_dark theme

	-- use("EdenEast/nightfox.nvim")
	-- use("morhetz/gruvbox")
	-- use("altercation/vim-colors-solarized")
	-- use({ "sonph/onehalf", rtp = "vim" }) -- buggy
	-- use("tanvirtin/monokai.nvim")
	--
	-- use("cpea2506/one_monokai.nvim")
	use("projekt0n/github-nvim-theme")

	-----------------------------------------------------------------------------

	use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("romgrk/barbar.nvim")

	use({ "numToStr/Comment.nvim", requires = { { "JoosepAlviste/nvim-ts-context-commentstring" } } })

	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
	})

	use({
		"nvim-lualine/lualine.nvim",
	})

	-- use("karb94/neoscroll.nvim")

	-- Git
	use("TimUntersberger/neogit")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("lewis6991/gitsigns.nvim")

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use("xiyaowong/transparent.nvim")

	use("MunifTanjim/prettier.nvim")

	-- use({
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	branch = "v3.x",
	-- 	requires = {
	-- 		--- Uncomment these if you want to manage LSP servers from neovim
	-- 		-- {'williamboman/mason.nvim'},
	-- 		-- {'williamboman/mason-lspconfig.nvim'},
	--
	-- 		-- LSP Support
	-- 		{ "neovim/nvim-lspconfig" },
	-- 		-- Autocompletion
	-- 		{ "hrsh7th/nvim-cmp" },
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "L3MON4D3/LuaSnip" },
	-- 	},
	-- })

	use("williamboman/mason-lspconfig.nvim")

	use("neovim/nvim-lspconfig")
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	-- use({
	-- 	"SmiteshP/nvim-navic",
	-- 	requires = "neovim/nvim-lspconfig",
	-- })
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	})
	use({
		"luukvbaal/statuscol.nvim",
	})

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
		requires = {
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- use("SirVer/ultisnips")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			-- {
			-- 	"quangnguyen30192/cmp-nvim-ultisnips",
			-- 	config = function()
			-- 		-- optional call to setup (see customization section)
			-- 		require("cmp_nvim_ultisnips").setup({})
			-- 	end,
			-- 	-- If you want to enable filetype detection based on treesitter:
			-- 	-- requires = { "nvim-treesitter/nvim-treesitter" },},
			-- },
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			-- "quangnguyen30192/cmp-nvim-ultisnips",
			"hrsh7th/cmp-nvim-lua",
			"octaltree/cmp-look",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("windwp/nvim-ts-autotag")
	use("github/copilot.vim")

	-- Debugging
	use({
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("mxsdev/nvim-dap-vscode-js")
	use("leoluz/nvim-dap-go")

	-- use("mxsdev/nvim-dap-vscode-js")
	-- use({
	-- 	"microsoft/vscode-js-debug",
	-- 	opt = true,
	-- 	run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	-- })

	-- use("tpope/vim-dadbod")
	-- use("kristijanhusak/vim-dadbod-ui")
	-- use("kristijanhusak/vim-dadbod-completion")

	use("mg979/vim-visual-multi")

	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	})

	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- theme = "hyper", --  theme is doom and hyper default is hyper
				-- config = {
				-- 	week_header = {
				-- 		enable = true,
				-- 	},
				-- 	shortcut = {
				-- 		{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				-- 		{
				-- 			icon = " ",
				-- 			icon_hl = "@variable",
				-- 			desc = "Files",
				-- 			group = "Label",
				-- 			action = "Telescope find_files",
				-- 			key = "f",
				-- 		},
				-- 		{
				-- 			desc = " Apps",
				-- 			group = "DiagnosticHint",
				-- 			action = "Telescope app",
				-- 			key = "a",
				-- 		},
				-- 		{
				-- 			desc = " dotfiles",
				-- 			group = "Number",
				-- 			action = "Telescope dotfiles",
				-- 			key = "d",
				-- 		},
				-- 	},
				-- },

				theme = "doom",
				config = {
					week_header = {
						enable = true,
					},
					center = {
						{
							icon = " ",
							-- icon_hl = "Title",
							desc = "Find File           ",
							desc_hl = "String",
							key = "f",
							keymap = "SPC f f",
							key_hl = "Number",
							-- key_format = " %s", -- remove default surrounding `[]`
							action = "Telescope find_files",
						},
						{
							icon = " ",
							desc = "Find Grep",
							desc_hl = "String",
							key = "g",
							keymap = "SPC f g",
							key_hl = "Number",
							-- key_format = " %s", -- remove default surrounding `[]`
							action = "Telescope live_grep",
						},
					},
					-- footer = {}, --your footer
				},
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
end)
