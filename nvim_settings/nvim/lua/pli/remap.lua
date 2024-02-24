vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)


-- clipboard -- 
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>v", "\"+p")
vim.keymap.set("v", "<leader>v", "\"+p")
vim.keymap.set("n", "<leader>V", "\"+P")


-- save --

vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>gi")
