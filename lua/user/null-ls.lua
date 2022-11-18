M = {}

M.setup = function(on_attach)
  local ok, null_ls = pcall(require, 'null-ls')
  if not ok then
    return
  end

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
