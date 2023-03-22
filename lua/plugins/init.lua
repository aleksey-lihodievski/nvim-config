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

	-- use("williamboman/nvim-lsp-installer")
	-- use({ "williamboman/mason.nvim" })
	use("neovim/nvim-lspconfig")
	-- use("williamboman/mason-lspconfig.nvim")
	-- use("kabouzeid/nvim-lspinstall")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin

	use("nvim-lua/plenary.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")

	use("TimUntersberger/neogit")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("lewis6991/gitsigns.nvim")

	use({ "neoclide/coc.nvim", branch = "release" })
	use("fatih/vim-go")
	use("tomlion/vim-solidity")

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
	use("xiyaowong/nvim-transparent")
	-- new
	use("sainnhe/edge")
	use("tiagovla/tokyodark.nvim")
	use("cpea2506/one_monokai.nvim")
	use("olimorris/onedarkpro.nvim")
	-- use("projekt0n/github-nvim-theme")
	use("nxvu699134/vn-night.nvim")
	use("sainnhe/sonokai")
	use({ "nyoom-engineering/oxocarbon.nvim" })

	-- Plug 'prettier/vim-prettier', {
	-- \ 'do': 'npm install --frozen-lockfile --production',
	-- \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
	--
	-- Plug 'bmatcuk/stylelint-lsp'

	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
end)
