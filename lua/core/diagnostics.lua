-- LSP diagnostics
vim.diagnostic.config({
	virtual_text = false, -- Turn off inline diagnostics
})

vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float()")

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
