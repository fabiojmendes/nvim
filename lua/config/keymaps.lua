-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Use gl for diagnostics
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- Maps <C-c> to <Esc> so it triggers abbreviations
vim.keymap.set("i", "<c-c>", "<esc>", { desc = "Escape" })

-- Plus register mappings
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank into plus register" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from plus register" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before from plus register" })
