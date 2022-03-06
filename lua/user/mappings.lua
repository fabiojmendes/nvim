local wk = require('which-key')
wk.setup()

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Add leader shortcuts
wk.register({
	s = {
		name = 'Search',
		f = { '<cmd>Telescope find_files<cr>', 'Find File' },
		b = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Find in Buffer' },
		g = { '<cmd>Telescope grep_string<cr>', 'Grep' },
		d = { '<cmd>Telescope diagnostics<cr>', 'Diagnostics' },
	},
	e = { '<cmd>NvimTreeToggle<CR>', 'File Explorer' },
	c = { '<cmd>Bdelete<CR>', 'Close Buffer' },
}, { prefix = '<leader>' })

-- Diagnostic keymaps
wk.register ({
	['gl'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Line Diagnostic'},
	['[d'] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev Diagnostic' },
	[']d'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic'},
})

-- Navigate buffers
wk.register {
	['<S-l>'] = { '<cmd>bnext <CR>', 'Next Buffer' },
	['<S-h>'] = { '<cmd>bprevious <CR>', 'Prev Buffer' },
}

-- Shorten function name
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

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


local M = {}

M.on_attach = function(_, bufnr)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', [[<cmd>lua vim.lsp.buf.formatting_sync()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]]
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
			f = { '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', 'Format' },
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
