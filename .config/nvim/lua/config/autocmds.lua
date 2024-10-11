-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Relative line numbers in normal mode
vim.api.nvim_create_autocmd('InsertLeave', {
  desc = 'Relative line numbers in normal mode',
  group = vim.api.nvim_create_augroup('relative-line-numbers', { clear = true }),
  callback = function()
    vim.wo.number = true
    vim.wo.relativenumber = true
  end,
})

-- Absolute line numbers in insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  desc = 'Absolute line numbers in insert mode',
  group = vim.api.nvim_create_augroup('absolute-line-numbers', { clear = true }),
  callback = function()
    vim.wo.number = true
    vim.wo.relativenumber = false
  end,
})

-- No neck pain (center layout on buffer enter)
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'No neck pain',
  group = vim.api.nvim_create_augroup('no-neck-pain', { clear = true }),
  callback = function()
    vim.cmd 'NoNeckPain'
  end,
})
