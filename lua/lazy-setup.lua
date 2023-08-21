local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local plugins_list = "plugins-list" -- Définir le nom du fichier attendu

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup(plugins_list, {
	defaults = {
		lazy = true,
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.8, height = 0.8 },
		wrap = true, -- wrap the lines in the ui
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "none",
		title = nil, ---@type string only works when border is not "none"
		title_pos = "center", ---@type "center" | "left" | "right"
		-- Show pills on top of the Lazy window
		pills = true, ---@type boolean
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "",
			not_loaded = "",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = " ",
			list = {
				"",
				"",
				"",
				"‒",
			},
		},
	},

	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = false,
		notify = true, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
})

-- function OnSave()
-- 	local buffer = vim.fn.expand("%:p")
-- 	local file_name = vim.fn.fnamemodify(buffer, ":t")
--
-- 	if file_name == (plugins_list .. ".lua") then
-- 		vim.api.nvim_input(":Lazy install<CR>")
-- 	end
-- end
--
-- vim.api.nvim_command("autocmd BufWritePost * lua OnSave()")
-- -- Need to check if the file have changed
