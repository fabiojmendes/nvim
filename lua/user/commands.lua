local function update_all()
  vim.cmd('TSUpdate')
  vim.cmd('autocmd User PackerComplete quit')
  vim.cmd('autocmd User PackerComplete Mason')
  require('packer').sync()
end

vim.api.nvim_create_user_command('UpdateAll', update_all, {})
