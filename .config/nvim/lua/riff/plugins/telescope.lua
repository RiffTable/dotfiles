-- You can do a lot more with Telescope
-- https://github.com/nvim-telescope/telescope.nvim
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            n = {
              ["<Esc><Esc>"] = require("telescope.actions").close,
            },
            i = {
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
      })

      -- set keymaps
      local keymap = vim.keymap
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Fuzzy find files"})
      keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "Grep for a string in the entire directory"})
      keymap.set("n", "<leader>fs", builtin.git_status, {desc = "Run Git Status"})
      keymap.set("n", "<leader>fc", builtin.git_commits, {desc = "List all git commits on the telescope UI"})
      -- keymap.set("n", "<leader>fx", builtin.colorscheme, {})

    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup{
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown{}
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  }
}
