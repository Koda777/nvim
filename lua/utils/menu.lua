local M = {}

function M.config()
	print("This is a test")
	nvim_open_win = function()
		local buf = vim.api.nvim_create_buf(false, true)

		local win = vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = 80,
			height = 20,
			row = 1,
			col = 1,
			style = "minimal",
			border = "single",
		})
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "se, world!" })
	end
	nvim_open_win()
end
return M
