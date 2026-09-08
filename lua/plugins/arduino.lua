return {
  -- Ensure the required language servers are downloaded via Mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "arduino-language-server",
        "clangd",
      })
    end,
  },

  -- Configure nvim-lspconfig to attach the server properly
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = {
          -- For standard configurations, lspconfig will attempt to find the binaries automatically.
          -- If it fails to launch, explicitly declare the execution paths like below:
          cmd = {
            "arduino-language-server",
            "-cli-config",
            vim.fn.expand("~/Library/Arduino15/arduino-cli.yaml"),
          },
        },
      },
    },
  },
}
