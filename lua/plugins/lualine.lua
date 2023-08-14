-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  gray = "#727169",
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  yellow = '#f18f01',
  violet = '#d183e8',
  grey   = '#303030',
  outerbg = "#16161D",
  blue_violet = '#5e4ae3',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.gray, gui = "bold" },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.black, bg = colors.outerbg },
	},

	insert = { a = { fg = colors.black, bg = colors.yellow, gui = "bold" } },
	visual = { a = { fg = colors.black, bg = colors.red } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black, gui = "bold" },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

require("lualine").setup({
	options = {
		theme = bubbles_theme,
		component_separators = "|",
		-- section_separators = { left = "", right = "" },
	},
	sections = {
		-- lualine_a = {
		-- { "branch", separator = { left = "" } },
		-- },
		lualine_b = { "diff", "location" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "progress" },
		-- lualine_z = {
		-- { "filetype", separator = { right = "" }, left_padding = 2 },
		-- },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
