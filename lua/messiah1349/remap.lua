vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", "\"0p")
vim.keymap.set("x", "<leader>P", "\"0P")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

--buffer clipboard
vim.keymap.set("n", "<leader>bp", "\"+p")
vim.keymap.set("n", "<leader>bp", "\"+p")
vim.keymap.set("v", "<leader>bP", "\"+P")
vim.keymap.set("v", "<leader>bP", "\"+P")


vim.keymap.set("n", "<leader>d", "\"+d")
vim.keymap.set("v", "<leader>d", "\"+d")

vim.keymap.set("i", "jj", "<esc>")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- window size
vim.keymap.set("n", "<leader>,", "10<C-w><")
vim.keymap.set("n", "<leader>.", "10<C-w>>")
vim.keymap.set("n", [[<leader>-]], "5<C-w>-")
vim.keymap.set("n", "<leader>=", "5<C-w>+")

-- terminal
vim.keymap.set("t", "jj", [[<C-\><C-n>]])

