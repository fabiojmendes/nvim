-- Lsp Options
return {
  {
    "saghen/blink.cmp",
    opts = {
      -- keymap = { preset = "super-tab" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = {
        enabled = false,
      },
      servers = {},
      setup = {},
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true,
        disable = { "yaml" },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "dprint" },
      },
      formatters = {
        dprint = {
          prepend_args = { "--config", vim.fn.stdpath("config") .. "/dprint.json" },
        },
      },
    },
  },
}
