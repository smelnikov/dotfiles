return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = { border = 'rounded' },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      'mason.nvim',
      'neovim/nvim-lspconfig',
      'b0o/schemastore.nvim',
    },
    opts = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities(nil, true)

      return {
        ensure_installed = {
          'cssls',
          'cssmodules_ls',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'pyright',
          'ruff',
          'stylelint_lsp',
          'taplo',
          'ts_ls',
          'yamlls',
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities,
            }
          end,
          cssmodules_ls = function()
            require('lspconfig').cssmodules_ls.setup {
              capabilities,
              init_options = {
                camelCase = false,
              },
            }
          end,
          eslint = function()
            require('lspconfig').eslint.setup {
              capabilities,
              settings = {
                codeActionOnSave = { enable = true, mode = 'all' },
              },
            }
          end,
          jsonls = function()
            require('lspconfig').jsonls.setup {
              capabilities,
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
              capabilities,
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
          rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup {
              capabilities,
              cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
              settings = {
                ['rust-analyzer'] = {
                  checkOnSave = {
                    command = 'clippy',
                  },
                },
              },
            }
          end,
          stylelint_lsp = function()
            require('lspconfig').stylelint_lsp.setup {
              capabilities,
              filetypes = { 'css' },
              settings = {
                stylelintplus = { autoFixOnFormat = true },
              },
            }
          end,
          ts_ls = function()
            require('lspconfig').ts_ls.setup {
              capabilities,
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
        'nvimtools/none-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = function()
          local f = require('null-ls').builtins.formatting
          return {
            sources = {
              f.black,
              f.isort,
              f.prettier,
              f.stylua,
            },
          }
        end,
      },
    },
    opts = {
      ensure_installed = nil,
      automatic_installation = true,
    },
  },
}
