require('user.options')
require('user.plugins')
require('user.lualine')
require('user.gitsigns')
require('user.telescope')
require('user.nvimtree')
require('user.bufferline')
require('user.coding')
require('user.treesitter')
require('user.comment')

local mappings = require('user.mappings')

local lsp = require('user.lsp')
lsp.setup(mappings.lsp_mappings)

local null_ls = require('user.null-ls')
null_ls.setup(mappings.lsp_mappings)
