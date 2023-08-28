local M = {}

function M.config()
	local g = vim.g

	g.gruvbox_flat_style = "hard"
	g.gruvbox_italic_functions = true
	g.gruvbox_hide_inactive_statusline = true
end

return M
