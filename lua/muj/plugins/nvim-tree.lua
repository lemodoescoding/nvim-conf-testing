return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      view = {
        width = 35,
      },

      renderer = {
        full_name = true,
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },

      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
    keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>")
    keymap.set("n", "<leader>ex", ":NvimTreeClose<CR>")
  end,
}
