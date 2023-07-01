return {
  -- add gruvbox
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Configure LazyVim to load onenord
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord",
    },
  },
}
