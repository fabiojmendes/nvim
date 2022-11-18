M = {}

M.setup = function(on_attach)
  local null_ls = require('null-ls')

  -- register any number of sources simultaneously
  local sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.formatting.fish_indent,
  }

  null_ls.setup({
    sources = sources,
    on_attach = on_attach,
  })
end

return M
