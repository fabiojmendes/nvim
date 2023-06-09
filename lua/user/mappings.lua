local M = {}

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Shorten function name
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Navigate buffers
keymap('n', '<S-l>', '<cmd>bnext <CR>', opts)
keymap('n', '<S-h>', '<cmd>bprevious <CR>', opts)
-- Move text up and down
keymap('n', '<A-j>', '<Esc>:m .+1<CR>==', opts)
keymap('n', '<A-k>', '<Esc>:m .-2<CR>==', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

-- Map esc to terminal window
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- Maps ctrl+c to Esc so it triggers abbreviations
keymap('i', '<C-c>', '<Esc>', opts)

local ok, wk = pcall(require, 'which-key')
if not ok then
  return M
end

wk.setup()
--Add leader shortcuts
wk.register({
  s = {
    name = 'Search',
    f = { '<cmd>Telescope find_files<cr>', 'Find Files' },
    h = { '<cmd>Telescope find_files hidden=true<cr>', 'Find Hidden Files' },
    b = { '<cmd>Telescope buffers<cr>', 'Find Buffer' },
    z = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Fuzzy find in Buffer' },
    g = { '<cmd>Telescope grep_string<cr>', 'Grep' },
    d = { '<cmd>Telescope diagnostics<cr>', 'Diagnostics' },
  },
  e = { '<cmd>NvimTreeToggle<CR>', 'File Explorer' },
  c = { '<cmd>Bdelete<CR>', 'Close Buffer' },
  C = { '<cmd>silent bufdo bd<CR>', 'Close All Buffers' },
  g = {
    name = 'Git Diffview',
    o = { '<cmd>DiffviewOpen<CR>', 'Diffview Open' },
    c = { '<cmd>DiffviewClose<CR>', 'Diffview Close' },
    h = { '<cmd>DiffviewFileHistory<CR>', 'Diffview File History' },
    r = { '<cmd>DiffviewRefresh<CR>', 'Diffview Refresh' },
  },
}, { prefix = '<leader>' })

-- Clipboard Paste Mappings
wk.register({
  p = { '"+p', 'Paste from clipboard' },
  P = { '"+P', 'Paste from clipboard' },
  d = { '"+d', 'Cut to clipboard' },
  y = { '"+y', 'Yank to clipboard' },
}, { prefix = '<leader>', mode = { 'n', 'v' } })

-- Diagnostic keymaps
wk.register({
  ['gl'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Line Diagnostic' },
  ['[d'] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev Diagnostic' },
  [']d'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic' },
  ['[g'] = { '<cmd>Gitsigns prev_hunk<CR>', 'Prev Git Diff' },
  [']g'] = { '<cmd>Gitsigns next_hunk<CR>', 'Next Git Diff' },
})

M.lsp_mappings = function(_, bufnr)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
  vim.api.nvim_set_keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  wk.register({
    g = {
      d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
      D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
    },
    ['<leader>l'] = {
      name = 'Lsp',
      a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
      r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
      f = { '<cmd>lua vim.lsp.buf.format()<CR>', 'Format' },
      e = { '<cmd>Telescope lsp_references<CR>', 'Search References' },
      i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation' },
      I = { '<cmd>Telescope lsp_implementations<CR>', 'Search Implementations' },
      s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Document Symbols' },
      S = { '<cmd>Telescope lsp_workspace_symbols<CR>', 'Workspace Symbols' },
      h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
    },
    K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Documentation' },
  }, { buffer = bufnr })
end

return M
