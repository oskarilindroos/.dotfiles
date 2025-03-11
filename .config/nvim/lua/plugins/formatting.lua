return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    event = 'BufReadPre',
    cmd = { 'ConformInfo' },
    config = function()
      require('conform').setup {
        format_on_save = function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end,
      }

      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
    opts = {
      notify_on_error = false,

      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = {}
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      formatters_by_ft = {
        lua = { 'stylua', stop_after_first = true },
        yaml = { 'yamlfmt', 'prettierd', stop_after_first = true },
        json = { 'prettierd', stop_after_first = true },
        jsonc = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        cpp = { 'clang-format', 'prettier', stop_after_first = true },
        c = { 'clang-format', 'prettier', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'gofmt', 'goimports' },
        sql = { 'sqlfmt', stop_after_first = true },
        sh = { 'beautysh', stop_after_first = true },
      },
    },
  },
}
