return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            files = {
              excludeDirs = { ".embuild" },
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
}
