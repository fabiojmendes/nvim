return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = false,
      },
      default_component_configs = {
        icon = {
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            unstaged = "",
            staged = "",
          },
        },
      },
    },
  },
}
