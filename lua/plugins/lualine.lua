local M = {}

function M.config()
	local colors = {
		darkgray = "#16161d",
		gray = "#727169",
		innerbg = nil,
		outerbg = "#16161D",
		normal = "#7e9cd8",
		insert = "#f18f01",
		visual = "#ff5189",
		replace = "#e46876",
		command = "#e6c384",
	}

	require("lualine").setup({
		options = {
			theme = {
				inactive = {
					a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				visual = {
					a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				replace = {
					a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				normal = {
					a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				insert = {
					a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
				command = {
					a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
					b = { fg = colors.gray, bg = colors.outerbg },
					c = { fg = colors.gray, bg = colors.innerbg },
				},
			},
		},
		sections = {
			lualine_b = { "branch", "diff" },
			lualine_c = { "fileformat" },
			lualine_x = {},
			lualine_y = { "progress" },
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
	})
end

return M
