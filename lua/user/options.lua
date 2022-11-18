-- Set highlight on search
-- vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Highlight the current line
vim.opt.cursorline = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.opt.termguicolors = true
-- The font used in graphical neovim applications
vim.opt.guifont = 'MesloLGS Nerd Font:h14'
vim.cmd('set laststatus=3')

-- Allows neovim to access the system clipboard
-- vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.expandtab = true
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.swapfile = false

vim.opt.timeoutlen = 250
-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Try to set the theme
if not pcall(vim.cmd, 'colorscheme onedarker') then
  vim.cmd('colorscheme habamax')
end
