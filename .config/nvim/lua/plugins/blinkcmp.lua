return {
  {
    'saghen/blink.cmp',
    build = 'cargo build --release',
    opts = {
      keymap = {
        preset = 'default',
        ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
        ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        ['<C-f>'] = { 'select_and_accept', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up' },
        ['<C-d>'] = { 'scroll_documentation_down' },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
        providers = {
          path = {
            opts = { trailing_slash = true, label_trailing_slash = true },
          },
        },
      },
      signature = {
        enabled = true,
        window = { border = 'rounded', scrollbar = false },
      },
      completion = {
        menu = {
          border = 'rounded',
          scrollbar = false,
          draw = {
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'pad', 'kind' },
            },
            components = {
              pad = {
                width = { fill = true },
                text = function() end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = { border = 'rounded', scrollbar = false },
        },
      },
    },
  },
}
