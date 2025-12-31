return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.g.tmux_navigator_no_mappings = 1 -- Disable default mappings

    vim.keymap.set('n', '<M-h>', ':TmuxNavigateLeft<CR>', {silent = true})
    vim.keymap.set('n', '<M-j>', ':TmuxNavigateDown<CR>', {silent = true})
    vim.keymap.set('n', '<M-k>', ':TmuxNavigateUp<CR>', {silent = true})
    vim.keymap.set('n', '<M-l>', ':TmuxNavigateRight<CR>', {silent = true})
  end,
}
