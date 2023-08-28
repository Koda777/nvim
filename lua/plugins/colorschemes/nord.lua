local M = {}

function M.config()
	vim.g.nord_contrast = false
	vim.g.nord_disable_background = false
	vim.g.nord_cursorline_transparent = true
	vim.g.nord_uniform_diff_background = true
	require("nord").set()
end

return M
