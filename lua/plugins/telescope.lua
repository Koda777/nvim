-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- set custom username for prompt
local custom_username = "777"

local function get_username()
	local username = os.getenv("USER")
	if username == nil then
		return "777"
	end
	return username
end

local function my_username()
	if custom_username == nil or custom_username == "" then
		return " " .. get_username() .. " ▶ "
	end
	return " " .. custom_username .. " ▶ "
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		prompt_position = "top",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		preview_cutoff = 5,
		winblend = 10,
		selection_caret = " ▶  ",
		entry_prefix = "  ",
		borderchars = {
			"─",
			"│",
			"─",
			"│",
			"╭",
			"╮",
			"╯",
			"╰",
		},
		color_devicons = true,
		file_ignore_patterns = { "node_modules", "bower_components", ".git" },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				["<C-u>"] = false,
				["<C-d>"] = false,
				["<C-l>"] = false,
				["<C-h>"] = false,
				["<Esc>"] = require("telescope.actions").close,
			},
			n = {
				["<Esc>"] = actions.close,
				["q"] = actions.close,
			},
		},
		win_options = {
			border = true,
			cursorline = true,
			number = true,
			relativenumber = true,
			width = 100,
			height = 130,
			wrap = false,
		},
		previewer = false,
		color_scheme = "dark",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_cutoff = 120,
				width_padding = 0.1,
				height = 0.6,
				preview_width = 100,
				preview_height = 130,
			},
		},
		prompt_prefix = my_username(),
		set_env = { ["COLORTERM"] = "truecolor" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("git_worktree")
telescope.load_extension("session-lens")
telescope.load_extension("fzf")
