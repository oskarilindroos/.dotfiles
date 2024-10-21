return {
  -- Colorscheme
  {
    'mcchrish/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'neobones'
    end,
  },

  -- Startup screen
  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.buttons.val = {
        dashboard.button('e', '> New file', ':ene <BAR><CR>'),
        dashboard.button('f', '> Find file', ':Telescope find_files<CR>'),
        dashboard.button('g', '> Grep', ':Telescope live_grep<CR>'),
        dashboard.button('r', '> Recent', ':Telescope oldfiles<CR>'),
        dashboard.button('p', '> Plugins', ':Lazy<CR>'),
        dashboard.button('s', '> Session restore', ':lua require("persistence").load()<CR>'),
        dashboard.button('q', '> Quit', ':qa<CR>'),
      }
      alpha.setup(dashboard.opts)
    end,
  },

  --  Indentation lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = ' ',
      },
      scope = {
        char = '▍',
      },
    },
  },

  -- File browser
  {
    'stevearc/oil.nvim',
    opts = {},
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.keymap.set('n', '<leader>f', '<cmd>Oil<cr>', { desc = 'File explorer' })
      require('oil').setup {
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
          -- is_always_hidden = function(name, bufnr)
          --   return name:match '%.git$'
          -- end,
        },
      }
    end,
  },

  -- Statusline
  {
    'echasnovski/mini.statusline',
    config = function()
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        local function calculateLocationPercentage()
          local current_line = vim.fn.line '.'
          local total_lines = vim.fn.line '$'
          return math.floor((current_line / total_lines) * 100)
        end

        return string.format('%d:%d %d%%%%', vim.fn.line '.', vim.fn.col '.', calculateLocationPercentage())
      end
    end,
  },

  -- Prettier options menu
  -- {
  --   'stevearc/dressing.nvim',
  --   lazy = true,
  --   init = function()
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     vim.ui.select = function(...)
  --       require('lazy').load { plugins = { 'dressing.nvim' } }
  --       return vim.ui.select(...)
  --     end
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     vim.ui.input = function(...)
  --       require('lazy').load { plugins = { 'dressing.nvim' } }
  --       return vim.ui.input(...)
  --     end
  --   end,
  -- },

  -- Centered layout
  {
    'shortcuts/no-neck-pain.nvim',
    cmd = 'NoNeckPain',
    keys = { { '<leader>un', '<cmd>NoNeckPain<cr>', desc = 'No Neck Pain' } },
    config = function()
      require('no-neck-pain').setup {}
    end,
  },

  -- Shows keybinds in a popup
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      spec = {
        { '<leader>c', group = 'code' },
        { '<leader>g', group = 'git' },
        { '<leader>u', group = 'ui' },
        { '<leader>s', group = 'search' },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },

  -- Better diagnostics, quickfix list
  -- {
  --   'folke/trouble.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   cmd = 'Trouble',
  --   keys = {
  --     {
  --       '<leader>xx',
  --       '<cmd>Trouble diagnostics toggle<cr>',
  --       desc = 'Diagnostics (Trouble)',
  --     },
  --     {
  --       '<leader>xX',
  --       '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  --       desc = 'Buffer Diagnostics (Trouble)',
  --     },
  --     { '<leader>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
  --     { '<leader>xq', '<cmd>Trouble quickfix toggle<cr>', desc = 'Quickfix List (Trouble)' },
  --   },
  --   opts = {},
  -- },

  -- Show colors in the editor
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {}
    end,
  },
}
