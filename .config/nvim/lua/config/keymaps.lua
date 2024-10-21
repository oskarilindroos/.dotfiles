-- Clear highlighted search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better vertical movement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +4<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -4<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize +4<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize -4<CR>')

-- Dark/light background toggle
vim.keymap.set('n', '<leader>ub', ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', { desc = 'Toggle dark/light mode' })

-- Linewrapping toggle
vim.keymap.set('n', '<leader>uw', ':set wrap!<CR>', { desc = 'Toggle line wrapping' })

-- Show diagnostic floating window (for long diagnostic messages)
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostic floating window' })
