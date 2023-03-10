local options = {
	relativenumber = true,
	number = true,
	tabstop = 2, -- set 4 spaces for a tab (prettier default)
	shiftwidth = 2, -- set 4 spaces for indent width
	expandtab = true, -- convert tab to spaces
	autoindent = true, -- copy indent from current line when starting new one
	mouse = "",
	hlsearch = true, -- highlight all matches on previous search pattern
	-- line wrapping
	wrap = true, -- disable line wrapping
	swapfile = false, -- creates a swapfile
	-- search settings
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	ignorecase = true, -- ignore case when searching
	smartcase = true, -- if you include mixed case in your search, assumes you want case-sensitive
	undofile = true, -- enable persistent undo
	-- cursor line
	cursorline = true, -- highlight the current cursor line
	-- turn on termguicolors for nightfly colorscheme to work
	-- (have to use iterm2 or any other true color terminal)
	termguicolors = true,
	background = "dark", -- colorschemes that can be light or dark will be made dark
	signcolumn = "yes", -- show sign column so that text doesn't shift
	cmdheight = 1,
	showcmd = false,
	-- backspace
	backspace = "indent,eol,start", -- allow backspace on indent, end of line or insert mode start position

	-- clipboard
	clipboard = "unnamedplus", -- use system clipboard as default register
	ruler = false,
	-- split windows
	splitright = true, -- split vertical window to the right
	splitbelow = true, -- split horizontal window to the bottom
}

vim.cmd("set nocursorline")
vim.cmd("set lazyredraw")

-- set color top bar
vim.cmd("hi TabLineFill term=bold cterm=bold ctermbg=0")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.o.shell = "/bin/zsh"
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set iskeyword+=_]])

-- delete wave sign in nvim
vim.cmd("set fillchars+=eob:\\ ")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
