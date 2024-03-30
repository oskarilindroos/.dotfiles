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
    'echasnovski/mini.starter',
    opts = function()
      local logo = table.concat({
        '            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z',
        '            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ',
        '            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ',
        '            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ',
        '            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ',
        '            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ',
      }, '\n')

      local pad = string.rep(' ', 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require 'mini.starter'
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Find file",       "Telescope find_files",                                   "Telescope"),
          new_section("Recent files",    "Telescope oldfiles",                                     "Telescope"),
          new_section("Grep text",       "Telescope live_grep",                                    "Telescope"),
          new_section("Config",          "Telescope find_files { cwd = vim.fn.stdpath 'config' }", "Config"),
          new_section("Lazy",            "Lazy",                                                   "Config"),
          new_section("New file",        "ene | startinsert",                                      "Built-in"),
          new_section("Quit",            "qa",                                                     "Built-in"),
          new_section("Session restore", [[lua require("persistence").load()]],                    "Session"),
        },
        footer = nil,
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
  },

  --  Indentation lines
  {
    'echasnovski/mini.indentscope',
    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- File browser
  {
    'echasnovski/mini.files',
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
    },
    vim.keymap.set('n', '<leader>f', ':lua MiniFiles.open()<CR>', { desc = 'File explorer' }),
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
        return '%2l:%-2v'
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
