local null_ls = require 'null-ls'

require('mason').setup {
  ui = {
    border = 'single',
  },
}

require('mason-null-ls').setup {
  ensure_installed = {
    'black',
    'isort',
    'prettier',
    'stylua',
  },
  handlers = {
    function(source_name, methods)
      require 'mason-null-ls.automatic_setup'(source_name, methods)
    end,
    prettier = function()
      null_ls.register(null_ls.builtins.formatting.prettier.with {
        only_local = 'node_modules/.bin',
      })
    end,
  },
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format {
          async = false,
          bufnr = bufnr,
          filter = function(c)
            return c.supports_method 'textDocument/formatting'
          end,
        }
      end,
    })
  end,
}
