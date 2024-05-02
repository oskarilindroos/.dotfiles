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

-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Show diagnostic floating window (for really long diagnostics)
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostic floating window' })
