vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup({
	show_end_of_line = false,
	show_current_context = true,
	space_char_blankline = " ",
	show_current_context_start = true,
})

vim.g.indent_blankline_filetype_exclude = { "alpha" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "dashboard" }
