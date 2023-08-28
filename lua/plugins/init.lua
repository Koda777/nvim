require("plugins.colorschemes.customize")

local sources = {
	"alpha",
	"autopairs", -- ?
	"catppucin", -- ?
	"comments",
	"indent_blankline",
	"harpoon",
	"rust-tools",
	"lualine",
	"copilot",
	"mini",
	"wilder", -- ?
	"lsp-colors", -- ?
	"transparent",
	"nvim-cmp",
	"telescope",
	"treesitter",
	"colorschemes.kanagawa",
}

local colorschemes = {
	"kanagawa",
	"gruvbox",
	"nord",
}

for _, source in ipairs(sources) do
	local currentName = "plugins." .. source
	local status_ok, module = pcall(require, currentName)
	if status_ok then
		module.config()
	else
		vim.api.nvim_err_writeln("Failed to load " .. currentName .. "\n\n" .. module)
	end
end

for _, source in ipairs(colorschemes) do
	local currentName = "plugins." .. "colorschemes." .. source
	local status_ok, module = pcall(require, currentName)
	if status_ok then
		module.config()
	else
		vim.api.nvim_err_writeln("Failed to load " .. currentName .. "\n\n" .. module)
	end
end
