return {
	"nikita-edel/capsdetect.nvim",
	config = function()
		require("capsdetect").setup({
			-- those are the defaults
			schedule = {
				no_schedule = false, -- turns of the scheduler / updater
				refresh_ms = 100, -- rate at which the update happens
				-- user provided call back with signature:
				-- act_on(state) where state is a bool
				-- which is setting the variable / updating the window
				callback = nil,
				-- decides if the global vim variable:
				-- vim.g.caps_state gets updated on schedule or not set at all
				update_global = true,
			},
			indicator = {
				use_indicator = true, -- use the builtin indicator
				highlight = "ErrorMsg", -- color of the "CAPS" text
				-- alternative:
				--highlight = {
				--fg = "#ff0000",
				--},
			},
		})
	end,
}
