local ok, nlsp = pcall(require, 'nlspsettings')
if not ok then
  return
end

nlsp.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_dir = '.nlsp',
  local_settings_root_markers = { '.git' },
  append_default_schemas = true,
  loader = 'json',
})
