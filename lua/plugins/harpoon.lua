local theme_background = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")

require("harpoon").setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
		save_on_buf_leave = true,
		hide_filename = false,
		exclude_patterns = {},
		save_on_directory_change = true,
		open_in_splits = true,
		insert_mode = true,
		reduce_to_unique_tab = false,
		term_bgcolor = theme_background,
		replace_termcodes = true,
		save_on_focus_lost = true,
		save_on_filetype_change = true,
	},
	menu = {
		width = vim.api.nvim_win_get_width(0) - 55,
		height = vim.api.nvim_win_get_height(0) - 35,
	},
})
