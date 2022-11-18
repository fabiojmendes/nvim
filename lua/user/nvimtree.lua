local ok, nvimtree = pcall(require, 'nvim-tree')
if not ok then
  return
end

nvimtree.setup({
  disable_netrw = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  git = {
    ignore = false,
  },
})
