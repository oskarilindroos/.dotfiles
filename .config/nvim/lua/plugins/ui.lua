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
        ['<leader>d'] = { name = '[d]ocument', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[g]it', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[r]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[s]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[w]orkspace', _ = 'which_key_ignore' },
        ['<leader>u'] = { name = '[u]i', _ = 'which_key_ignore' },
      }
    end,
  },

  -- Telescope file explorer
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
}
