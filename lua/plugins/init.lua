require("plugins.treesitter")

require("plugins.lsp")

local sources = {
	"plugins.alpha",
	"plugins.autopairs", -- ?
	"plugins.catppucin", -- ?
	"plugins.comments",
	"plugins.indent_blankline",
	"plugins.harpoon",
	"plugins.lualine",
	"plugins.copilot",
	"plugins.mini",
	"plugins.wilder", -- ?
	"plugins.lsp-colors", -- ?
	"plugins.transparent",
	"plugins.nvim-cmp",
	"plugins.telescope",
	"plugins.treesitter",
	"plugins.colorschemes.kanagawa",
}

for _, source in ipairs(sources) do
	local status_ok, module = pcall(require, source)
	if status_ok then
		module.config()
	else
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. module)
	end
end
