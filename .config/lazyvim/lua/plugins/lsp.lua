return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = {
        border = 'single',
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'folke/neodev.nvim',
        opts = { experimental = { pathStrict = true } },
      },
      'mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'b0o/schemastore.nvim',
    },
    opts = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      return {
        ensure_installed = {
          'clangd',
          'cssls',
          'cssmodules_ls',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'pyright',
          'rust_analyzer',
          'stylelint_lsp',
          'taplo',
          'tsserver',
          'yamlls',
          'zls',
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
            }
          end,
          cssmodules_ls = function()
            require('lspconfig').cssmodules_ls.setup {
              capabilities = capabilities,
              init_options = {
                camelCase = false,
              },
            }
          end,
          eslint = function()
            require('lspconfig').eslint.setup {
              capabilities = capabilities,
              settings = {
                codeActionOnSave = { enable = true, mode = 'all' },
              },
            }
          end,
          jsonls = function()
            require('lspconfig').jsonls.setup {
              capabilities = capabilities,
              init_options = { provideFormatter = false },
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
            }
          end,
          lua_ls = function()
            require('lspconfig').lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  completion = { callSnippet = 'Replace' },
                  format = { enable = false },
                  runtime = { version = 'LuaJIT' },
                  telemetry = { enable = false },
                  workspace = { checkThirdParty = false },
                },
              },
            }
          end,
          stylelint_lsp = function()
            require('lspconfig').stylelint_lsp.setup {
              capabilities = capabilities,
              filetypes = { 'css' },
              settings = {
                stylelintplus = { autoFixOnFormat = true },
              },
            }
          end,
          tsserver = function()
            require('lspconfig').tsserver.setup {
              capabilities = capabilities,
              settings = {
                completions = { completeFunctionCalls = true },
              },
            }
          end,
          yamlls = function()
            require('lspconfig').yamlls.setup {
              settings = {
                redhat = { telemetry = { enabled = false } },
                yaml = { keyOrdering = false },
              },
            }
          end,
        },
      }
    end,
  },
  {
    'jayp0521/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason.nvim',
      {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
      },
    },
    opts = {
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
          require('null-ls').register(
            require('null-ls.builtins.formatting.prettier').with {
              only_local = 'node_modules/.bin',
            }
          )
        end,
      },
    },
  },
}