return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    event = 'BufReadPre',
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,

      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      formatters_by_ft = {
        lua = { 'stylua' },
        yaml = { { 'yamlfmt', 'prettierd' } },
        json = { 'prettierd' },
        jsonc = { { 'prettierd', 'prettier' } },
        markdown = { 'prettierd', 'prettier' },
        html = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        cpp = { { 'clang-format', 'prettier' } },
        c = { { 'clang-format', 'prettier' } },
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        go = { { 'gofmt', 'goimports' } },
        sql = { 'sqlfmt' },
        sh = { 'beautysh' },
      },
    },
  },
}
