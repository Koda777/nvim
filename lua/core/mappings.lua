local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Define leader key
vim.g.mapleader = " "

-- Change Esc in insert mode
keymap("i", "jk", "<Esc>", opts)
keymap("v", "fd", "<Esc>", opts)

-- Save file
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>g", ":close!<CR>", opts)

-- Close buffer
keymap("n", "<leader>q", ":wqall!<CR>", opts)

-- Use Ctrl+v to paste
keymap("n", "<C-v>", "p", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags

-- Bufferline
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-j>", ":BufferLineCyclePrev<CR>", opts)

-- Harpoon
keymap("n", "<leader>y", ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap("n", "<leader>t", ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap("n", "<leader>l", ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap("n", "<leader>s", ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

keymap("n", "<leader>e", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", "<leader>a", ':lua require("harpoon.mark").add_file()<CR>', opts)

-- Copilot
keymap("i", "<C-u>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- Visual Block
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Open file in browser
-- Open file in browser
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)

-- Comment a line
keymap("n", "<leader>c", ":CommentToggle<CR>", opts)

-- Switch between buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Terminal
keymap("n", "<C-t>", [[<Cmd>lua require("FTerm").toggle()<CR>]], opts)
keymap("t", "<C-t>", [[<C-\><C-n><Cmd>lua require("FTerm").toggle()<CR>]], opts)

-- Copy to clipboard
keymap("v", "<leader>y", [["+y]], opts)

-- Center screen
keymap("n", "<leader>zz", "zz", opts)

-- Packer
keymap("n", "<leader>ps", ":PackerSync<CR>", opts)
keymap("n", "<leader>pi", ":PackerInstall<CR>", opts)
keymap("n", "<leader>pu", ":PackerUpdate<CR>", opts)

-- Resize pane
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-j>", ":resize +2<CR>", opts)
keymap("n", "<M-k>", ":resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Quickfix
keymap("n", "<leader>qc", ":cclose<CR>", opts)
keymap("n", "<leader>qo", ":copen<CR>", opts)
keymap("n", "<leader>qn", ":cnext<CR>", opts)
keymap("n", "<leader>qp", ":cprevious<CR>", opts)

-- LSP
keymap("n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>lr", ":lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>ls", ":lua vim.lsp.buf.document_symbol()<CR>", opts)
keymap("n", "<leader>lw", ":lua vim.lsp.buf.workspace_symbol()<CR>", opts)
keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts)

-- Git
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gd", ":Gvdiff<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)
keymap("n", "<leader>gp", ":Git push<CR>", opts)

-- Redo
vim.api.nvim_set_keymap("n", "<C-r>", "<Cmd>redo<CR>", opts)

-- motion
keymap("n", "<C-[>", "{", opts)
keymap("v", "<C-[>", "{", opts)
keymap("n", "<C-]>", "}", opts)
keymap("v", "<C-]>", "}", opts)
keymap("n", "<C-g>", "G", opts)

-- Delete and insert
keymap("n", "<C-c>", "C", opts)

-- Mini Files Explorer
keymap("n", "<leader>f", ":lua MiniFiles.open()<CR>", opts)

-- one at a time in the floating window)
vim.api.nvim_set_keymap("n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>", opts)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap("n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>", opts)

-- Mapping floaterm lazygit
vim.api.nvim_set_keymap(
	"n",
	"<leader>gg",
	":FloatermNew --height=0.9 --width=0.9 --name=Lazygit --title=LazyGit lazygit<CR>",
	opts
)

keymap("n", "<C-;>", "<cmd>FineCmdline<CR>", opts)
