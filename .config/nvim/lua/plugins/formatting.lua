return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    opts = function()
      ---@type conform.setupOpts
      return {
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return {}
        end,
        formatters = {
          prettier = {
            require_cwd = true,
          },
        },
        formatters_by_ft = {
          _ = { lsp_format = 'fallback' },
          css = { 'prettier' },
          html = { 'prettier' },
          javascript = { 'eslint', 'prettier' },
          javascriptreact = { 'eslint', 'prettier' },
          json = { 'prettier' },
          less = { 'prettier' },
          lua = { 'stylua' },
          python = { 'isort', 'black' },
          markdown = { 'prettier' },
          typescript = { 'eslint', 'prettier' },
          typescriptreact = { 'eslint', 'prettier' },
          yaml = { 'prettier' },
        },
      }
    end,
    init = function()
      vim.api.nvim_create_user_command('Format', function()
        require('conform').format()
      end, {})

      vim.api.nvim_create_user_command('FormatStart', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {})

      vim.api.nvim_create_user_command('FormatStop', function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, { bang = true })
    end,
  },
}
