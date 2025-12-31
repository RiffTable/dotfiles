return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    local gitsigns = require('gitsigns')

    gitsigns.setup({
      on_attach = function(bufnr)
        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, {desc = "Stage Hunk"})
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, {desc = "Stage Hunk"})

        map('n', '<leader>hr', gitsigns.reset_hunk, {desc = "Reset Hunk"})
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, {desc = "Reset Hunk"})

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end, {desc = "Blame Line"})

        map('n', '<leader>hd', gitsigns.diffthis, {desc = "Diff This"})

        map('n', '<leader>hD', function()
          gitsigns.diffthis('~')
        end, {desc = "Diff This"})

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {desc = "Toggle Current Line Blame"})
        map('n', '<leader>tw', gitsigns.toggle_word_diff, {desc = "Toggle Word Diff"})
      end
    })
  end
}

-- :Gitsigns toggle_signs
-- :Gitsigns toggle_numhl
-- :Gitsigns toggle_linehl
-- :Gitsigns toggle_word_diff
-- :Gitsigns toggle_current_line_blame
