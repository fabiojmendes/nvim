-- Lsp Options
return {
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
}
