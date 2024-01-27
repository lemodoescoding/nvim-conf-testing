return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },

      ensure_installled = {
        "c",
        "cpp",
        "json",
        "javascript",
        "typescript",
        "php",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
      },

      auto_install = true,

      rainbow = { enable = true },

      require("nvim-ts-autotag").setup()
    })
  end,
}
