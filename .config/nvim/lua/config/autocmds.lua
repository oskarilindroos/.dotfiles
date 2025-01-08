-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Check if diagnostics are available before setting loclist
local function safe_set_loclist()
  if vim.fn.buflisted(vim.api.nvim_get_current_buf()) == 1 then
    vim.diagnostic.setloclist { open = false }
  end
end

-- Populate loclist with the current buffer diagnostics on DiagnosticChanged
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  desc = 'Populate loclist with the current buffer diagnostics',
  callback = safe_set_loclist,
})

-- Populate loclist with the current buffer diagnostics on BufEnter
vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Populate loclist with the current buffer diagnostics',
  callback = safe_set_loclist,
})

-- Activate ZenMode when entering Vim
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Activate ZenMode when entering Vim',
  callback = function()
    require('zen-mode').toggle()
  end,
})
