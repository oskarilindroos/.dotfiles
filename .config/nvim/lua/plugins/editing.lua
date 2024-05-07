return {
  -- Highlight todos, notes etc
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Automatically add closing brackets, parenthesis, quotes, etc.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- Make quickfix lists editable like a buffer
  {
    'gabrielpoca/replacer.nvim',
    keys = {
      {
        '<leader>xe',
        function()
          require('replacer').run()
        end,
        desc = 'Make quickfix editable',
      },
    },
  },
}
