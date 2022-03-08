require 'user.plugins'
require 'user.options'
require 'user.general'
require 'user.coding'

local mappings = require 'user.mappings'
local lsp = require 'user.lsp'

lsp.setup(mappings.lsp_mappings)
