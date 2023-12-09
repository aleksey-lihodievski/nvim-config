return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- use("kyazdani42/nvim-web-devicons")
	-- use("kyazdani42/nvim-tree.lua")

	use("nvim-tree/nvim-web-devicons")
	use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })

	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("nvim-lualine/lualine.nvim")
	use("romgrk/barbar.nvim")
	use("jiangmiao/auto-pairs")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("windwp/nvim-ts-autotag")
	use("github/copilot.vim")

	-- use("williamboman/nvim-lsp-installer")
	-- use({ "williamboman/mason.nvim" })

	use("neovim/nvim-lspconfig")

	-- use("williamboman/mason-lspconfig.nvim")
	-- use("kabouzeid/nvim-lspinstall")

	use({
		"hrsh7th/nvim-cmp",
		requires = {
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
		},
	})
	-- use("hrsh7th/nvim-cmp", {
	-- 	requires = {
	-- 		{ "hrsh7th/cmp-buffer" },
	-- 		{ "hrsh7th/cmp-path" },
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "saadparwaiz1/cmp_luasnip" },
	-- 	},
	-- }) -- Autocompletion plugin
	-- -- requires = { { "cmps" } },
	-- -- requires = {{"nvim-lua/popup.nvim", opt = true}, {"nvim-lua/plenary.nvim", opt = true}},
	-- use("hrsh7th/cmp-buffer")
	-- use("hrsh7th/cmp-path")
	-- use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	-- use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		-- tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		-- run = "make install_jsregexp",
	})
	-- use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("rafamadriz/friendly-snippets")

	use("nvim-lua/plenary.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")

	use("TimUntersberger/neogit")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("lewis6991/gitsigns.nvim")
	use("rcarriga/nvim-notify")

	use({ "neoclide/coc.nvim", branch = "release" })
	use("fatih/vim-go")
	use("tomlion/vim-solidity")
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	-- use("kristijanhusak/vim-dadbod-completion")

	-- use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	-- Themes
	use("rebelot/kanagawa.nvim")
	-- use("sainnhe/edge")
	use("EdenEast/nightfox.nvim")
	use("dracula/vim")
	-- use("morhetz/gruvbox")
	use("folke/tokyonight.nvim")
	use("mhartington/oceanic-next")
	-- use("altercation/vim-colors-solarized")
	use("rakr/vim-one")
	-- use({ "sonph/onehalf", rtp = "vim" }) -- buggy
	use({ "Everblush/everblush.nvim", as = "everblush" })
	-- use("catppuccin/nvim") -- very pretty one
	use("tanvirtin/monokai.nvim")
	use("xiyaowong/transparent.nvim")
	-- new
	use("sainnhe/edge")
	use("tiagovla/tokyodark.nvim")
	use("cpea2506/one_monokai.nvim")
	use("olimorris/onedarkpro.nvim")
	-- use("projekt0n/github-nvim-theme")
	use("nxvu699134/vn-night.nvim")
	use("sainnhe/sonokai")
	use({ "nyoom-engineering/oxocarbon.nvim" })
	-- colorful
	use("jsit/toast.vim") -- nice but props not so readable
	use("maximumtiu/true.vim") -- nice but props not so readable
	use("drazil100/dusklight.vim") -- nice
	use("nikolvs/vim-sunbather") -- impressive!

	-- Plug 'prettier/vim-prettier', {
	-- \ 'do': 'npm install --frozen-lockfile --production',
	-- \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
	--
	-- Plug 'bmatcuk/stylelint-lsp'

	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
end)
