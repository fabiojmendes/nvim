local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

bufferline.setup({
  options = {
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
    diagnostics = 'nvim_lsp',
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
})
