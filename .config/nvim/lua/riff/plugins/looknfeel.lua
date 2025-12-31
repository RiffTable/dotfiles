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
