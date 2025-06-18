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
      servers = {
        ltex = {
          mason = false,
          keys = {
            {
              "K",
              function()
                local bufnr = vim.api.nvim_get_current_buf()
                if vim.lsp.get_clients({ bufnr = bufnr, name = "ltex" }) then
                  require("user.dictionary").word_under_cursor()
                else
                  vim.lsp.hover()
                end
              end,
            },
          },
        },
      },
      setup = {
        ltex = function(_, opts)
          local lang = "en-US"
          -- opts.autostart = false
          opts.root_dir = require("lazyvim.util").root.get()
          opts.settings = {
            ltex = {
              language = lang,
              dictionary = {
                [lang] = {},
              },
              markdown = {
                nodes = {
                  ["Link"] = "dummy",
                },
              },
              languageToolHttpServerUri = vim.env.LANGUAGE_TOOL_HTTP_SERVER_URI,
              additionalRules = {
                enablePickyRules = true,
              },
            },
          }
          opts.on_init = function(client)
            local spell_file_name = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
            local spell_file = io.open(spell_file_name, "r")
            if spell_file then
              local dict = client.config.settings.ltex.dictionary[lang]
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
