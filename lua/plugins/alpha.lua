local M = {}

function M.config()
	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return
	end

	local status_ok, ascii = pcall(require, "utils.ascii")
	if not status_ok then
		print("error ascii")
		return
	end

	local dashboard = require("alpha.themes.dashboard")

	math.randomseed(os.time())

	function GeneratorLogo()
		local result = math.random(1, #ascii)
		return ascii[result]
	end

	dashboard.section.header.val = GeneratorLogo()

	function ChangeDirectoryTmux(path)
		local tmuxCdCommand = "cd ~/.config/nvim/"
		local status = os.execute(tmuxCdCommand)

		if status == 0 then
			print("Command executed successfully")
		else
			print("Command failed")
		end
	end

	dashboard.section.buttons.val = {
		dashboard.button("p", "  Projects", ":Telescope find_files<Space>-C=~/Project<CR>"),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
		-- dashboard.button("c", " " .. " Config", ":lcd ~/.config/nvim | edit init.lua <CR>"),
		dashboard.button("c", " " .. " Config", ":lua ChangeDirectoryTmux() <CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}

	local function footer()
		return "Don't Stop Until You are Proud..."
	end

	dashboard.section.footer.val = footer()

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	alpha.setup(dashboard.opts)
end

return M
