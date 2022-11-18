require('user.options')
require('user.plugins')
require('user.general')
require('user.lualine')
require('user.gitsigns')
require('user.coding')

local mappings = require('user.mappings')

local lsp = require('user.lsp')
lsp.setup(mappings.lsp_mappings)

local null_ls = require('user.null-ls')
null_ls.setup(mappings.lsp_mappings)
