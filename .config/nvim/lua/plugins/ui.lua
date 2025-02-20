return {
  -- Colorscheme
  {
    'mcchrish/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'vimbones'
    end,
  },

  -- VScode colorscheme
  {
    'Mofiqul/vscode.nvim',
    opts = {},
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

      dashboard.section.footer.val = {
        '花は花ではない',
        'A Flower is not a flower',
      }

      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
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

  -- Centered layout
  -- {
  --   'shortcuts/no-neck-pain.nvim',
  --   cmd = 'NoNeckPain',
  --   keys = { { '<leader>un', '<cmd>NoNeckPain<cr>', desc = 'No Neck Pain' } },
  --   config = function()
  --     require('no-neck-pain').setup {}
  --   end,
  -- },

  -- Zen mode (mostly using it for a centered layout)
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' },
      {
        '<leader>uz',
        function()
          -- Toggle between friendly and unfriendly colorscheme
          -- Friendly meaning easier to read for other people
          function toggle_friendly_theme()
            local current_colorscheme = vim.g.colors_name
            local friendly_colorscheme = 'vscode'
            local my_colorscheme = 'neobones'

            if current_colorscheme ~= friendly_colorscheme then
              vim.cmd('colorscheme ' .. friendly_colorscheme)
              vim.o.background = 'dark'
            else
              vim.cmd('colorscheme ' .. my_colorscheme)
              vim.o.background = 'light'
            end
          end

          toggle_friendly_theme()

          local zen_mode = require 'zen-mode'
          zen_mode.toggle {
            window = {
              width = 0.6,
              height = 0.85,
              options = {
                signcolumn = 'no',
                relativenumber = false,
                number = false,
              },
            },
            plugins = {
              options = {
                laststatus = 0,
              },
              twilight = { enabled = true },
            },
          }
        end,
        desc = 'Distraction-free zen mode',
      },
    },
    opts = {
      plugins = {
        options = {
          laststatus = 3,
        },
        twilight = { enabled = false },
      },
    },
  },

  -- Dim inactive code
  {
    'folke/twilight.nvim',
    cmd = 'Twilight',
    opts = {},
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

  -- Render markdown better in Neovim
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {},
  },

  -- Better diagnostics, quickfix list
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      { '<leader>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xq', '<cmd>Trouble quickfix toggle<cr>', desc = 'Quickfix List (Trouble)' },
    },
    opts = {},
  },

  -- Show colors in the editor
  {
    'NvChad/nvim-colorizer.lua',
    opts = {},
  },
}
