require('user.plugins')
require('user.options')
require('user.mappings')
require('user.coding')

--Set statusbar
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

--Enable Comment.nvim
require('Comment').setup()

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
local telescope = require('telescope')
if not pcall(telescope.load_extension, 'fzf') then
  vim.notify('no fzf')
end


require('nvim-tree').setup {
  disable_netrw = true,
  update_cwd = true,
  auto_close = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  }
}

-- Bufferline Setup
require('bufferline').setup {
  options = {
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
  }
}

-- Auto pairs
require('nvim-autopairs').setup()

-- vim: ts=2 sts=2 sw=2 et
