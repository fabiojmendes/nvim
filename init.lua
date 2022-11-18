require('user.options')
require('user.plugins')
-- Packer not fully loaded
if PACKER_BOOTSTRAP then
  return
end

require('user.general')
require('user.coding')

local mappings = require('user.mappings')

local lsp = require('user.lsp')
lsp.setup(mappings.lsp_mappings)

local null_ls = require('user.null-ls')
null_ls.setup(mappings.lsp_mappings)
