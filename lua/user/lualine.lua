local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

--Set statusbar
lualine.setup({
  options = {
    icons_enabled = false,
  },
  sections = {
    lualine_b = {
      'branch',
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
      },
      'diagnostics',
    },
    lualine_c = {
      'lsp_progress',
    },
  },
})
