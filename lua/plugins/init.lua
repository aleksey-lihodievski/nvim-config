return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
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
	use("terrortylor/nvim-comment")

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
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release
	})

	use({ "neoclide/coc.nvim", branch = "release" })
	use("fatih/vim-go")

	-- use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	-- Themes
	use("rebelot/kanagawa.nvim")
	-- use 'sainnhe/edge'
	-- use 'EdenEast/nightfox.nvim', { 'tag': 'v1.0.0' }
	-- use("dracula/vim")
	-- use("morhetz/gruvbox")
	-- use 'folke/tokyonight.nvim', { 'branch': 'main' }
	use("mhartington/oceanic-next")
	-- use("altercation/vim-colors-solarized")
	use("rakr/vim-one")
	-- use({ "sonph/onehalf", rtp = "vim" }) buggy

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
