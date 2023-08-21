-- LSP diagnostics
vim.diagnostic.config({
	virtual_text = false, -- Turn off inline diagnostics
})
-- Display diagnostics
-- function PrintDiagnostics(opts, bufnr, line_nr, client_id)
-- 	bufnr = bufnr or 0
-- 	line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
-- 	opts = opts or { ["lnum"] = line_nr }
--
-- 	local line_diagnostics = vim.diagnostic.get(bufnr, opts)
-- 	if vim.tbl_isempty(line_diagnostics) then
-- 		return
-- 	end
--
-- 	local diagnostic_message = ""
-- 	for i, diagnostic in ipairs(line_diagnostics) do
-- 		diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
-- 		print(diagnostic_message)
-- 		if i ~= #line_diagnostics then
-- 			diagnostic_message = diagnostic_message .. "\n"
-- 		end
-- 	end
-- 	vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
-- end
-- vim.cmd([[ autocmd! CursorHold * lua PrintDiagnostics() ]])

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
