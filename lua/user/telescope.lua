local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
})

-- Enable telescope fzf native
if not pcall(telescope.load_extension, 'fzf') then
  vim.notify('no fzf')
end
