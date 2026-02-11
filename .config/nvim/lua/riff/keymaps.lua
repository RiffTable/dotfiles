vim.g.mapleader = " "

function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap  -- Default to true
  opts.silent = opts.silent == nil and true or opts.silent  -- Default to true

  vim.keymap.set(mode, lhs, rhs, opts)
end






-- map('n', '<leader>dd', vim.diagnostic.disable, {})
map('n', '<leader>dd', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, {})

vim.keymap.set('n', '<F1>', '<Nop>')
vim.keymap.set('i', '<F1>', '<Nop>')


map('n', '<Esc><Esc>', ':nohlsearch<CR>', {desc = "Hide search highlights"});
map('i', "jj", "<Esc>", {desc = "Exits insert mode without Esc or ctrl+["})
-- map('n', "K", "kJ", {desc = "Join N lines; default is 2"})
-- map('n', "<Enter>", "o<Esc>", {desc = "Create newline after the current line"})

map('n', '<leader>bn', ':bnext<CR>', {desc = "Switch to the next buffer"})
map('n', '<leader>bp', ':bprevious<CR>', {desc = "Switch to the previous buffer"})

--- Standard Conventions
map({'n','v'}, "<C-z>", "u", {desc = "Undo"})
map('i', "<C-z>", "<C-o>u", {desc = "Undo (insert)"})
map('i', "<CR>", "<C-g>u<CR>", {desc = "Enter creates a undo break"})
map('i', "<C-r>", "<C-g>u<C-r>", {desc = "Pasting creates a undo break"})
-- map('i', "<C-Del>", "<Esc>dwi", {desc = "Delete the rest of the word to the right"})
-- map('i', "<C-BS>", "<Esc>dbs", {desc = "Delete the rest of the word to the left"})

  -- doesn't work normally. Only works if pressed with shift key
map({'n','v','i'}, "<Home>", "^", {desc = "Jumps to the start of the line (indent)"})
map({'n','v','i'}, "<End>", "$",  {desc = "Jumps to the end of the line"})

-- Home and End key
-- map({'n','x','o'}, "H", "^", {noremap = true, desc = "Jumps to the start of the line (indent)"})
-- map({'n','x','o'}, "L", "$", {noremap = true, desc = "Jumps to the end of the line"})
-- map({'n','x','o'}, "M", "0", {noremap = true, desc = "Jumps to the start of the line"})

--- Surround selection with braces/quotes
-- map('v', "s(", "c()<Esc>Pl", {desc = "Surround the selection with the character"}

--- Window Navigation
map('n', "<C-h>", "<C-w>h", {desc = "Move to the window at the left"})
map('n', "<C-j>", "<C-w>j", {desc = "Move to the window at the down"})
map('n', "<C-k>", "<C-w>k", {desc = "Move to the window at the up"})
map('n', "<C-l>", "<C-w>l", {desc = "Move to the window at the right"})

--- Resize Windows
map('n', "<C-Left>", "<C-w><", {desc = "Resize left"})
map('n', "<C-Down>", "<C-w>-", {desc = "Resize down"})
map('n', "<C-Up>", "<C-w>+", {desc = "Resize up"})
map('n', "<C-Right>", "<C-w>>", {desc = "Resize right"})
