return {
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {
        fzf_opts = {
          ['--layout'] = 'reverse-list',
          ['--info'] = 'inline',
        },
        keymap = {
          fzf = {
            ['ctrl-q'] = 'select-all+accept',
          },
        },
      }

      vim.keymap.set('n', '<leader>sf', "<cmd>lua require('fzf-lua').files()<CR>", { desc = 'files' })
      vim.keymap.set('n', '<leader>sg', "<cmd>lua require('fzf-lua').live_grep()<CR>", { desc = 'grep' })
      vim.keymap.set('n', '<leader><leader>', "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = 'buffers' })
      vim.keymap.set('n', '<leader>sh', "<cmd>lua require('fzf-lua').help_tags()<CR>", { desc = 'help tags' })
      vim.keymap.set('n', '<leader>sr', "<cmd>lua require('fzf-lua').resume()<CR>", { desc = 'resume' })
      vim.keymap.set('n', '<leader>ss', "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<CR>", { desc = 'lsp workspace symbols' })
      vim.keymap.set('n', '<leader>sd', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", { desc = 'lsp document symbols' })
      vim.keymap.set('n', '<leader>si', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", { desc = 'lsp definitions' })
      vim.keymap.set('n', '<leader>st', "<cmd>lua require('fzf-lua').lsp_type_definitions()<CR>", { desc = 'lsp type definitions' })
      vim.keymap.set('n', '<leader>sr', "<cmd>lua require('fzf-lua').lsp_references()<CR>", { desc = 'lsp references' })
      vim.keymap.set('n', '<leader>sm', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", { desc = 'lsp implementations' })
      vim.keymap.set('n', '<leader>so', "<cmd>lua require('fzf-lua').lsp_document_diagnostics()<CR>", { desc = 'lsp document diagnostics' })
      vim.keymap.set('n', '<leader>sl', "<cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>", { desc = 'lsp workspace diagnostics' })
    end,
  },

  -- Fuzzy Finder (files, lsp, etc):w
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- local trouble = require 'trouble.providers.telescope'
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          mappings = {
            i = { ['<c-q>'] = actions.smart_send_to_qflist },
            n = { ['<c-q>'] = actions.smart_send_to_qflist },
          },
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
          },
          grep_string = {
            additional_args = { '--hidden' },
          },
          live_grep = {
            additional_args = { '--hidden' },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = '[S]earch [C]olorschemes' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
