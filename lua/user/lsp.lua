M = {}

M.setup = function(on_attach)
  -- nvim-cmp supports additional completion capabilities
  local cmp_lsp = require 'cmp_nvim_lsp'
  local capabilities = cmp_lsp.default_capabilities()

  local lsp_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded', width = 95 }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    },
  }

  local nlspsettings = require 'nlspsettings'

  nlspsettings.setup {
    config_home = vim.fn.stdpath 'config' .. '/nlsp-settings',
    local_settings_dir = '.nlsp',
    local_settings_root_markers = { '.git' },
    append_default_schemas = true,
    loader = 'json',
  }

  -- FreeBSD doesn't support lsp_installer
  if vim.fn.has 'bsd' == 1 then
    local lspconfig = require 'lspconfig'
    lspconfig.rust_analyzer.setup(lsp_opts)
    return
  end

  -- LSP settings
  local lspconfig = require 'lspconfig'
  require('mason').setup()
  require('mason-lspconfig').setup()
  require('mason-lspconfig').setup_handlers {
    function(server_name) -- default handler (optional)
      lspconfig[server_name].setup(lsp_opts)
    end,
  }

  local sumneko_opts = vim.tbl_deep_extend('force', lsp_opts, {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  })
  lspconfig.sumneko_lua.setup(sumneko_opts)

end

return M
