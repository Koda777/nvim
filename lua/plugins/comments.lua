-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

-- enable comment
comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = "gc",
		block = "gb",
	},
	extra = {
		above = "gcO",
		below = "gco",
		eol = "gca",
	},
	mappings = {
		basic = true,
		extra = true,
	},
	pre_hook = nil,
	post_hook = nil,
})
