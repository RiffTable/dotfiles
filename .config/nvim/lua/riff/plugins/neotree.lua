return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      window = {
        mappings = {
          -- Removing default keybinds
          ["<space>"] = "noop",
          ["P"] = "noop",
          ["a"] = "noop",
          ["A"] = "noop",
          ["l"] = "noop",
          ["C"] = "noop",
          ["b"] = "noop",


          --- Custom keybinds
          ["<esc>"] = {"cancel"}, -- close preview or floating neo-tree window
          ["<cr>"] = {"open"},
          ["<leader>o"] = {"open_nofocus"},
          ["<leader><cr>"] = {"open_nofocus"},
          ["<2-LeftMouse>"] = {"open"},
          ["<F1>"] = {"close_window"},
          ["?"] = {"show_help"},
          ["q"] = {"close_window"},
          ["R"] = {"refresh"},

          ["<tab>"] = {"next_source"},
          ["<"] = {"prev_source"},
          [">"] = {"next_source"},

          -- Both add commands support BASH style brace expansion
          ["n"] = {"add"},
          ["N"] = {"add_directory"},

          ["d"] = {"delete"},
          ["r"] = {"rename"},
          ["<F2>"] = {"rename"},
          ["m"] = {"move"},

          ["i"] = {"show_file_details"},
          ["c"] = {"copy"},
          ["x"] = {"cut_to_clipboard"},
          ["y"] = {"copy_to_clipboard"},

          ["S"] = {"open_vsplit"},
          ["s"] = {"open_split"},
          ["t"] = {"open_tabnew"},

          ["w"] = {"open_with_window_picker"},
          ["p"] = {"toggle_preview", config = {use_float = false, use_image_nvim = true}},
          ["z"] = {"close_all_nodes"},
          ["Z"] = {"expand_all_nodes"},
          ["H"] = {"toggle_hidden"},
        }
      },
      commands = {
        open_nofocus = function(state)
          require("neo-tree.sources.filesystem.commands").open(state)
          vim.schedule(function()
            vim.cmd([[Neotree close]])
          end)
        end,
      },
    })

    -- vim.keymap.set({'n','v'}, '<c-b>', '<Cmd>Neotree filesystem reveal left<CR>', {})
    -- vim.keymap.set('i', '<c-b>', '<Esc><Cmd>Neotree filesystem reveal left<CR>', {})
    vim.keymap.set({'n','v'}, '<F1>', '<Cmd>Neotree filesystem reveal left<CR>', {})
    vim.keymap.set('i', '<F1>', '<Esc><Cmd>Neotree filesystem reveal left<CR>', {})
  end,
}
