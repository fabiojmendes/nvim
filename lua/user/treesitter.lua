local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

-- Parsers must be installed manually via :TSInstall
configs.setup({
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'diff',
    'dockerfile',
    'fish',
    'go',
    'java',
    'javascript',
    'json',
    'json5',
    'lua',
    'make',
    'markdown',
    'python',
    'regex',
    'rust',
    'sql',
    'toml',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
})
