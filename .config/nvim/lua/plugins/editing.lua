return {
  -- Highlight todos, notes etc
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- {
  --   -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --   -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  --   -- - sd'   - [S]urround [D]elete [']quotes
  --   -- - sr)'  - [S]urround [R]eplace [)] [']
  --   'echasnovski/mini.surround',
  --   opts = {},
  -- },

  -- Automatically add closing html tags
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  -- Automatically add closing brackets, parenthesis, quotes, etc.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- Navigate and leap around fast
  -- {
  --   'folke/flash.nvim',
  --   event = 'VeryLazy',
  --   ---@type Flash.Config
  --   opts = {},
  --   -- stylua: ignore
  --   keys = {
  --     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --     { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  --   },
  -- },
}
