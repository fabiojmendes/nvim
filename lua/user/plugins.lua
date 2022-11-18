-- Install packer
vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

PACKER_BOOTSTRAP = ensure_packer()

local packer = require('packer')
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

packer.startup(function(use)
  use('wbthomason/packer.nvim')
  -- My plugins here
  use('numToStr/Comment.nvim') -- 'gc' to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use('nvim-lualine/lualine.nvim') -- Fancier statusline
  use('arkav/lualine-lsp-progress')
  -- Themes
  -- use { "lunarvim/onedarker.nvim" }
  -- use { 'LunarVim/onedarker.nvim', commit = 'b00dd21' }
  use('fabiojmendes/onedarker.nvim')
  use('LunarVim/darkplus.nvim')
  use('EdenEast/nightfox.nvim')
  use('folke/tokyonight.nvim')
  -- Add indentation guides even on blank lines
  use('lukas-reineke/indent-blankline.nvim')
  -- Add git related info in the signs columns and popups
  use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } })
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use('nvim-treesitter/nvim-treesitter')
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-textobjects')

  -- Simple to use language server installer
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })

  use('jose-elias-alvarez/null-ls.nvim')

  use('tamago324/nlsp-settings.nvim')
  -- Autocompletion plugin
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('saadparwaiz1/cmp_luasnip')
  use('L3MON4D3/LuaSnip') -- Snippets plugin
  use('onsails/lspkind-nvim')

  -- Tree Explorer
  use({ 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } })
  -- Buffer Line
  use({ 'akinsho/bufferline.nvim', requires = { 'moll/vim-bbye' } })
  use('windwp/nvim-autopairs') -- Autopairs, integrates with both cmp and treesitter
  -- Which Key
  use('folke/which-key.nvim')
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
