-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
vim.g.mapleader = " "

-- Save
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Quit
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Close buffer
vim.keymap.set("n", "<leader>d", ":bd<CR>", { desc = "Close buffer" })

-- Better vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize +4<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -4<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +4<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -4<CR>")
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Resize windows equally" })

-- Maximize active window
vim.keymap.set("n", "<leader>wf", ":MaximizerToggle<CR>", { desc = "Maximize active window" })

-- Better paste
vim.keymap.set({ "n", "x" }, "<leader>p", [["0p]], { desc = "paste from yank register" })

-- Dark/light background toggle
vim.api.nvim_set_keymap(
  "n",
  "<leader>tt",
  ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>',
  { noremap = true, silent = true, desc = "Toggle light/dark mode" }
)

-- Show git hunks
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Toggle git hunks" })
