return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local colorize = require("colorizer")

    colorize.setup({
      "*",
      css = {
        css = true,
        css_fn = true,
        mode = "background",
      },
    })
  end
}
