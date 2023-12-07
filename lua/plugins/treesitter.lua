local M = {}

function M.config()
	-- import nvim-treesitter plugin safely
	local status, treesitter = pcall(require, "nvim-treesitter.configs")
	if not status then
		return
	end

	-- Function to check if the file type is ".dart"
	-- Indent doesn't work with dart files
	local function isDartFile()
		local file_extension = vim.fn.expand("%:e")
		print(file_extension)
		if file_extension == "dart" then
			return false
		else
			return true
		end
	end

	treesitter.setup({
		-- enable syntax highlighting
		highlight = {
			enable = true,
		},
		-- enable indentation
		indent = { enable = false, disable = { "dart" } },
		-- enable autotagging (w/ nvim-ts-autotag plugin)
		autotag = { enable = true },
		-- ensure these language parsers are installed
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
		},
		-- auto install above language parsers
		auto_install = true,
	})
end

return M
