_G.my_enable_state = 0

-- LSP diagnostics
vim.diagnostic.config({
	virtual_text = false, -- Turn off inline diagnostics
})

function open_non_focusable_float()
	local bufnr = math.floor(vim.fn.bufnr())
	local cursor_pos = math.floor(vim.fn.line("."))

	local opts = {
		relative = "cursor",
		row = cursor_pos - 1,
		col = 0,
		focusable = false,
	}
	vim.diagnostic.open_float(bufnr, opts)
end

function ToggleEnableState()
	file_path = "/tmp/diagnostic.tmp"
	local file = io.open(file_path, "r")
	if file then
		local enable_state = file:read("*line")
		file:close()

		if enable_state == "enable=true" then
			vim.cmd("autocmd CursorHold * lua open_non_focusable_float()")
		else
			vim.cmd("autocmd! CursorHold *")
		end
	end
end

function WriteState()
	if _G.my_enable_state == 0 then
		_G.my_enable_state = 1
		content = "enable=true"
	else
		_G.my_enable_state = 0
		content = "enable=false"
	end

	file_path = "/tmp/diagnostic.tmp"
	local file = io.open(file_path, "w")
	if file then
		file:write(content)
		file:close()
	else
		print("Failed to create/open the file.")
	end
end

vim.api.nvim_set_keymap("n", "<Leader>da", ":lua WriteState()<CR>", { noremap = true, silent = true })

vim.cmd([[
augroup AutoToggleEnableState
    autocmd!
    autocmd CursorHold * lua ToggleEnableState()
augroup END
]])

-- LSP Saga disable warning
notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	if
		msg:match(
			"[lspsaga.nvim] you're running outdated nightly version, you'll need LspNotify autocmd event to enable improved symbol"
		)
	then
		return
	end
	notify(msg, ...)
end
