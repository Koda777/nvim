local impatient_ok, impatient = pcall(require, "impatient")

if impatient_ok then
	impatient.enable_profile()
end

for _, source in ipairs({
	"lazy-setup",
	"plugins",
	"plugins.lsp",
	"core.colorscheme",
	"core.mappings",
	"core.options",
	"core.diagnostics",
	-- "sensational",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		error("Error loading " .. source .. "\n\n" .. fault)
	end
end
