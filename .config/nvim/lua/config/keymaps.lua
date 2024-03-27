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
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Resize windows equally' })

-- Splits
vim.keymap.set('n', '<leader>-', ':split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { desc = 'Vertical split' })

-- Dark/light background toggle
vim.keymap.set('n', '<leader>ub', ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', { desc = 'Toggle dark/light mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
