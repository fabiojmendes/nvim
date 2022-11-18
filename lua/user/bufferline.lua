local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

bufferline.setup({
  options = {
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
  },
})
