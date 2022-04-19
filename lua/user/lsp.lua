M = {}

M.setup = function(on_attach)
  -- nvim-cmp supports additional completion capabilities
  local cmp_lsp = require 'cmp_nvim_lsp'
  local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local lsp_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded', width = 95 }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    },
  }

  -- FreeBSD doesn't support lsp_installer
  if vim.fn.has 'bsd' == 1 then
    local lspconfig = require 'lspconfig'
    lspconfig.rust_analyzer.setup(lsp_opts)
    return
  end

  -- LSP settings
  local lsp_installer = require 'nvim-lsp-installer'

  -- Register a handler that will be called for all installed servers.
  lsp_installer.on_server_ready(function(server)
    local opts = lsp_opts
    if server.name == 'sumneko_lua' then
      -- Example custom server
      local sumneko_opts = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }

      opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end
    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end)
end

return M
