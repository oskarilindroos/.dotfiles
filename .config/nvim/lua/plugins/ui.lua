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
  {
    'stevearc/dressing.nvim',
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.input(...)
      end
    end,
  },

  -- Centered layout
  {
    'shortcuts/no-neck-pain.nvim',
    cmd = 'NoNeckPain',
    keys = { { '<leader>un', '<cmd>NoNeckPain<cr>', desc = 'No Neck Pain' } },
    config = true,
  },

  -- Shows pending keybinds
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[c]ode', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[b]uffer', _ = 'which_key_ignore' },
        ['<leader>x'] = { name = '[x]', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[g]it', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[r]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[s]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[w]orkspace', _ = 'which_key_ignore' },
        ['<leader>u'] = { name = '[u]i', _ = 'which_key_ignore' },
      }
    end,
  },

  -- Better diagnostics, quickfix list
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'TroubleToggle', 'Trouble' },
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
      { '<leader>xl', '<cmd>TroubleToggle loclist<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix List (Trouble)' },
    },
    opts = {},
  },

  -- Show colors in the editor
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- Show lightbulb when code actions are available
  { 'kosayoda/nvim-lightbulb', opts = { autocmd = { enabled = true } } },
}
