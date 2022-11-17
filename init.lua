require 'user.plugins'
require 'user.options'
require 'user.general'
require 'user.coding'
require 'user.null-ls'

local mappings = require 'user.mappings'
local lsp = require 'user.lsp'

lsp.setup(mappings.lsp_mappings)
