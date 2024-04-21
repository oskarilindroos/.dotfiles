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
        },
      }
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  },

  -- Statusline
  {
    'echasnovski/mini.statusline',
    -- opts = {
    --   use_icons = vim.g.have_nerd_font,
    -- },
    config = function()
      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        local function calculateLocationPercentage()
          local current_line = vim.fn.line '.'
          local total_lines = vim.fn.line '$'
          return math.floor((current_line / total_lines) * 100)
        end

        return string.format('%d:%d %d%%%%', vim.fn.line '.', vim.fn.col '.', calculateLocationPercentage())
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  -- Better options menu
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
        ['<leader>d'] = { name = '[d]iagnostics', _ = 'which_key_ignore' },
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
      { '<leader>dd', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
      { '<leader>dw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
      { '<leader>dl', '<cmd>TroubleToggle loclist<cr>', desc = 'Location List (Trouble)' },
      { '<leader>dq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix List (Trouble)' },
    },
    opts = {},
  },

  -- Render diagnostics using virtual lines on top of the real line of code
  {
    'https://git.sr.ht/%7Ewhynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()

      -- Use virtual text by default
      vim.diagnostic.config {
        virtual_text = true,
        virtual_lines = false,
      }

      -- Keybind to toggle virtual lines and virtual text
      vim.keymap.set('n', '<leader>e', function()
        local virtual_lines_enabled = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config { virtual_lines = virtual_lines_enabled, virtual_text = not virtual_lines_enabled }
      end, { desc = 'Toggle diagnostics vline/text' })
    end,
  },

  -- Show colors in the editor
  {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',
    config = function()
      vim.g.Hexokinase_highlighters = { 'virtual' }
      vim.g.Hexokinase_optInPatterns = {
        'full_hex',
        'triple_hex',
        'rgb',
        'rgba',
        'hsl',
        'hsla',
        'color_names',
      }
    end,
  },

  -- Show lightbulb when code actions are available
  { 'kosayoda/nvim-lightbulb', opts = { autocmd = { enabled = true } } },
}
