return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("nvim-surround").setup({
        -- Configuration here
        --
        -- :TransparentToggle<CR>
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup({
        whitespace = {
          remove_blankline_trail = false,
        },
        scope = { enabled = false }
      })
    end
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup({
        -- register = "+",
        color_preview =  "█ %s",
        default_format = "hex", -- This can be hex, hsl or rgb
        default_color = "#000000",
        border = "rounded",
        mappings = {
          increment = "l",
          decrement = "h",
          increment_big = "L",
          decrement_big = "H",

          min_value = "0",
          max_value = "$",
          -- save the current color in the register specified above with the format specified above
          set_register_default_format = "<cr>",
          -- save the current color in the register specified above with a format you can choose
          set_register_choose_format = "g<cr>",
          -- replace the color under the cursor with the current color in the format specified above
          replace_default_format = "<m-cr>",
          -- replace the color under the cursor with the current color in a format you can choose
          replace_choose_format = "g<m-cr>",
          -- export the current color to a different tool
          export = "E",
          -- set the value to a certain number (done by just entering numbers)
          set_value = "c",
          -- toggle transparency
          transparency = "T",
          -- choose the background (for transparent colors)
          choose_background = "B",
          -- quit window
          quit_window = { "q", "<esc>" }
        }
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      preset = "helix"
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
