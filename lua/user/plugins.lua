-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use { 'numToStr/Comment.nvim' } -- 'gc' to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-lualine/lualine.nvim' } -- Fancier statusline
  use { 'arkav/lualine-lsp-progress' }
  -- Themes
  use { 'fabiojmendes/onedarker.nvim' }
  use { 'LunarVim/darkplus.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'olimorris/onedarkpro.nvim' }
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter', requires = { 'nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter/playground' } }
  -- use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  -- Simple to use language server installer
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use 'tamago324/nlsp-settings.nvim'
  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind-nvim'

  -- Tree Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  -- Buffer Line
  use { 'akinsho/bufferline.nvim', requires = { 'moll/vim-bbye' } }
  use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
  -- Which Key
  use 'folke/which-key.nvim'
end)
