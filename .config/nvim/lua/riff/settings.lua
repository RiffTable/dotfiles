local global = vim.g
local option = vim.opt

-- Editor options
option.number	        = true
option.relativenumber	= true
option.clipboard		  = "unnamedplus"
-- vim.api.nvim_set_option("clipboard", "unnamed")
option.syntax         = "on"

option.encoding			  = "UTF-8"
option.ttimeoutlen	  = 1   	-- The time in ms that is waited for a key code or mapped key sequence to complete
option.showcmd			  = true
option.showmatch		  = true
option.cursorline		  = true
option.termguicolors  = true

option.mouse          = "a"

option.smarttab			  = true
option.expandtab		  = false
option.autoindent		  = true
option.tabstop			  = 4
option.shiftwidth		  = 4
option.softtabstop    = 4


-- Unique language based config s
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python" },
  callback = function()
		vim.opt_local.expandtab   = false
    vim.opt_local.tabstop     = 2
    vim.opt_local.shiftwidth  = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Compile command
vim.api.nvim_create_user_command("Build", function()
  local ft = vim.bo.filetype

  if ft == 'c' then
    vim.cmd('!gcc -Wall -o %:r %')
  elseif ft == 'cpp' then
    vim.cmd('!g++ -Wall -o %:r %')
  elseif ft == 'java' then
    vim.cmd('!javac %')
  else
    print("Unsupported filetype: " .. ft)
  end
end, {})

-- Don't create comments on newline
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({'o'})
  end,
})

-- Show help menu at side instead of bottom
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd("wincmd L")
    end
  end,
})
