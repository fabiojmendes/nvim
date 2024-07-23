return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        rust_analyzer = {
          keys = {
            { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
            { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
            { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
          },
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust.
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
      },
    },
    -- Disable semantic tokens for rust strings tree-sitter injections will work
    init = function()
      vim.api.nvim_set_hl(0, "@lsp.type.string.rust", {})
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    },
  },

  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = true,
  },
}
