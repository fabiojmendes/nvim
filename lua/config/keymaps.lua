-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.fn.executable("gitui") == 1 then
  -- gitui instead of lazygit
  vim.keymap.set("n", "<leader>gg", function()
    require("lazyvim.util").terminal.open({ "gitui" })
  end, { desc = "gitui (cwd)" })
  vim.keymap.set("n", "<leader>gG", function()
    require("lazyvim.util").terminal.open({ "gitui" }, { cwd = require("lazyvim.util").root.get() })
  end, { desc = "gitui (root dir)" })
end

-- Use gl for diagnostics
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- Maps <C-c> to <Esc> so it triggers abbreviations
vim.keymap.set("i", "<c-c>", "<esc>", { desc = "Escape" })

-- Map mac keys to alt-j & alt-k
vim.cmd("map ∆ <M-j>")
vim.cmd("map ˚ <M-k>")
