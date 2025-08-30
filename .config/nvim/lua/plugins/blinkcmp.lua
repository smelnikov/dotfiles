return {
  {
    'saghen/blink.cmp',
    version = '*',
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
        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' },
        },
        providers = {
          path = {
            opts = { trailing_slash = true, label_trailing_slash = true },
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },
      signature = {
        enabled = true,
        window = { border = 'rounded', scrollbar = false },
      },
      completion = {
        accept = { auto_brackets = { enabled = false } },
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
          auto_show_delay_ms = 0,
          window = { border = 'rounded', scrollbar = false },
        },
      },

      cmdline = {
        completion = {
          ghost_text = { enabled = false },
        },
        keymap = {
          ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
          ['<C-n>'] = { 'show', 'select_next', 'fallback' },
          ['<C-f>'] = { 'select_and_accept', 'fallback' },
        },
      },
    },
  },
}
