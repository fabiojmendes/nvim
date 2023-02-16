local M = {}

M.setup = function(on_attach)
  local ok, lspconfig = pcall(require, 'lspconfig')
  if not ok then
    return
  end

  -- nvim-cmp supports additional completion capabilities
  local cmp_lsp = require('cmp_nvim_lsp')
  local capabilities = cmp_lsp.default_capabilities()

  local lsp_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded', width = 95 }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    },
  }

  -- Mason
  require('mason').setup()
  require('mason-lspconfig').setup()
  require('mason-lspconfig').setup_handlers({
    function(server_name) -- default handler (optional)
      lspconfig[server_name].setup(lsp_opts)
    end,
  })

  -- Lua configs
  local lua_opts = vim.tbl_deep_extend('force', lsp_opts, {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  })
  lspconfig.lua_ls.setup(lua_opts)
end

return M
