return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "catppuccin-mocha",
          "OceanicNext",
          "substrata",
        },
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --   -- require("catppuccin").setup()
    --   vim.cmd.colorscheme "catppuccin-mocha"
    -- end
  },
  {
    "mhartington/oceanic-next",
    name = "OceanicNext"
  },
  {
    "kvrohit/substrata.nvim",
    name = "substrata"
  },
}
