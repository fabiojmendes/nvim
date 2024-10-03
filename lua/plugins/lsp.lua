-- Lsp Options
return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "noselect",
      }
      opts.experimental = {
        ghost_text = false,
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })
    end,
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
      setup = {
        ltex = function(_, opts)
          -- opts.autostart = false
          opts.settings = {
            ltex = {
              dictionary = {
                ["en-US"] = {},
              },
            },
          }
          opts.on_init = function(client)
            local spell_file_name = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
            local spell_file = io.open(spell_file_name, "r")
            if spell_file then
              local dict = client.config.settings.ltex.dictionary["en-US"]
              for line in spell_file:lines() do
                table.insert(dict, line)
              end
              spell_file:close()
            end
          end
        end,
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
