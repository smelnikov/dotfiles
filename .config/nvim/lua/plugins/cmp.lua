return {
  {
    'L3MON4D3/LuaSnip',
    version = '1.*',
    opts = { history = true },
    config = function(_, opts)
      require('luasnip').config.set_config(opts)
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'L3MON4D3/LuaSnip',
    },
    opts = function()
      local cmp = require 'cmp'

      return {
        mapping = {
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-5),
          ['<C-d>'] = cmp.mapping.scroll_docs(5),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              cmp.complete()
            end
          end),
        },
        sources = cmp.config.sources({
          {
            name = 'path',
            options = { label_trailing_slash = true, trailing_slash = true },
          },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = 'buffer' },
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },
}
