--Set statusbar
require('lualine').setup {
  options = {
    icons_enabled = false,
  },
  sections = {
    lualine_b = {
      'branch',
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
      },
      'diagnostics',
    },
  },
}

-- Gitsigns
require('gitsigns').setup()

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
local telescope = require 'telescope'
if not pcall(telescope.load_extension, 'fzf') then
  vim.notify 'no fzf'
end

require('nvim-tree').setup {
  disable_netrw = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  git = {
    ignore = false,
  },
}

-- Bufferline Setup
require('bufferline').setup {
  options = {
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
  },
}
