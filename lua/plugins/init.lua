return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sainnhe/edge'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use 'romgrk/barbar.nvim'
  use 'jiangmiao/auto-pairs' 
  use 'terrortylor/nvim-comment'
 
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  -- Plug 'prettier/vim-prettier', {
  -- \ 'do': 'npm install --frozen-lockfile --production',
  -- \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
  --
  -- Plug 'bmatcuk/stylelint-lsp'

  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

end)
