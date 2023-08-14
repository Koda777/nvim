local palettes = {
	all = {
		sel0 = "#CC8B8C", -- Popup bg, visual selection bg
		sel1 = "#adbac7", -- Popup sel bg, search bg
	},
	github_dark = {
		red = {
			base = "#8e1519",
			bright = "#ee0000",
		},
	},
	github_dark_dimmed = {
		bg1 = "#444c56",
		sel0 = "#CC8B8C", -- Popup bg, visual selection bg
		sel1 = "#adbac7", -- Popup sel bg, search bg
		comment = "#444c56",
	},
}

local specs = {
	all = {
		syntax = {
			keyword = "green",
			conditional = "magenta.bright",
			number = "orange",
		},
		git = {
			changed = "#ffa261",
		},
	},
	github_dark = {
		syntax = {
			operator = "orange",
		},
	},
}

require("github-theme").setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/github-theme",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
		hide_nc_statusline = true, -- Override the underline style for non-active statuslines
		transparent = false, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = true, -- Non focused panes set to alternative background
		module_default = true, -- Default enable value for modules
		styles = { -- Style to be applied to different syntax groups
			comments = "italic", -- Value is any valid attr-list value `:help attr-list`
			functions = "bold",
			keywords = "italic,bold",
			variables = "bold",
			conditionals = "NONE",
			constants = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "italic,bold",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = false,
			search = false,
		},
		darken = { -- Darken floating windows and sidebar-like windows
			floats = true,
			sidebars = {
				enable = true,
				list = {}, -- Apply dark background to specific windows
			},
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
	palettes = palettes,
	specs = {},
	groups = {},
})
