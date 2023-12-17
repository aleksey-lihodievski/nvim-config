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
		config = function()
			require("lualine").setup()
		end,
	})

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

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	use("SirVer/ultisnips")
	-- 	-- use("L3MON4D3/LuaSnip") -- Snippets plugin
	-- 	use("rafamadriz/friendly-snippets")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{
				"quangnguyen30192/cmp-nvim-ultisnips",
				config = function()
					-- optional call to setup (see customization section)
					require("cmp_nvim_ultisnips").setup({})
				end,
				-- If you want to enable filetype detection based on treesitter:
				-- requires = { "nvim-treesitter/nvim-treesitter" },},
			},
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"quangnguyen30192/cmp-nvim-ultisnips",
			"hrsh7th/cmp-nvim-lua",
			"octaltree/cmp-look",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
			-- "hrsh7th/cmp-omni",
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
	use("mfussenegger/nvim-dap")
	-- use("theHamsta/nvim-dap-virtual-tex")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")

	use("mg979/vim-visual-multi")
end)
