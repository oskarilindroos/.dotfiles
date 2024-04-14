return {
  -- Navigate to Tmux panes with Ctrl+hjkl
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  -- Save and restore session
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
  },

  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  {
    -- {{{ Define the Harpoon lazy.vim specificaiton.

    'ThePrimeagen/harpoon',
    enabled = true,
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },

    -- ----------------------------------------------------------------------- }}}
    -- {{{ Define events to load Harpoon.

    keys = function()
      local harpoon = require 'harpoon'
      local conf = require('telescope.config').values

      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end
        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      return {
        -- Harpoon marked files 1 through 4
        {
          '<F1>',
          function()
            harpoon:list():select(1)
          end,
          desc = 'Harpoon buffer 1',
        },
        {
          '<F2>',
          function()
            harpoon:list():select(2)
          end,
          desc = 'Harpoon buffer 2',
        },
        {
          '<F3>',
          function()
            harpoon:list():select(3)
          end,
          desc = 'Harpoon buffer 3',
        },
        {
          '<F4>',
          function()
            harpoon:list():select(4)
          end,
          desc = 'Harpoon buffer 4',
        },
        {
          '<F5>',
          function()
            harpoon:list():select(5)
          end,
          desc = 'Harpoon buffer 5',
        },

        -- Harpoon next and previous.
        {
          '<S-L>',
          function()
            harpoon:list():next()
          end,
          desc = 'Harpoon next buffer',
        },
        {
          '<S-H>',
          function()
            harpoon:list():prev()
          end,
          desc = 'Harpoon prev buffer',
        },

        -- Harpoon user interface.
        {
          '<leader>h',
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'Harpoon Toggle Menu',
        },
        {
          '<leader>H',
          function()
            harpoon:list():append()
          end,
          desc = 'Harpoon add file',
        },
      }
    end,

    -- ----------------------------------------------------------------------- }}}
    -- {{{ Use Harpoon defaults or my customizations.

    opts = function(_, opts)
      opts.settings = {
        save_on_toggle = false,
        sync_on_ui_close = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { 'harpoon', 'alpha', 'dashboard', 'gitcommit' },
        mark_branch = false,
        key = function()
          return vim.loop.cwd()
        end,
      }
    end,

    -- ----------------------------------------------------------------------- }}}
    -- {{{ Configure Harpoon.

    config = function(_, opts)
      local harpoon = require('harpoon').setup(opts)

      local function set_harpoon_colors()
        vim.cmd 'highlight link HarpoonNumberActive Special'
        vim.cmd 'highlight link HarpoonActive Special'
        vim.cmd 'highlight link HarpoonNumberInactive Comment'
        vim.cmd 'highlight link HarpoonInactive Comment'
      end

      set_harpoon_colors()

      function Harpoon_files()
        local contents = {}
        local marks_length = harpoon:list():length()
        local current_file_path = vim.fn.fnamemodify(vim.fn.expand '%:p', ':.')
        for index = 1, marks_length do
          local harpoon_file_path = harpoon:list():get(index).value
          local file_name = harpoon_file_path == '' and '(empty)' or vim.fn.fnamemodify(harpoon_file_path, ':t')

          if current_file_path == harpoon_file_path then
            contents[index] = string.format('%%#HarpoonNumberActive#[ %s. %%#HarpoonActive#%s ]', index, file_name)
          else
            contents[index] = string.format('%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ', index, file_name)
          end
        end

        return table.concat(contents)
      end

      -- Update colors on theme change or background change
      vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
        callback = function()
          set_harpoon_colors()
        end,
      })

      vim.opt.showtabline = 2
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'User' }, {
        callback = function(ev)
          vim.o.tabline = Harpoon_files()
        end,
      })
    end,

    -- ----------------------------------------------------------------------- }}}
  },
}
