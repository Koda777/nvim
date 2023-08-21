function clear_empty_registers()
	local current_file = vim.fn.expand("%:p")
	local file_name = vim.fn.fnamemodify(current_file, ":t")
	print(file_name)
end
clear_empty_registers()
