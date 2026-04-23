return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {},
    config = function(_, opts)
      local nvim_treesitter = require 'nvim-treesitter'
      nvim_treesitter.setup(opts)

      local langs = {}
      vim.list_extend(langs, nvim_treesitter.get_available(1))
      vim.list_extend(langs, nvim_treesitter.get_available(2))
      vim.list.unique(langs)

      local filetypes = {}
      for _, language in ipairs(langs) do
        vim.list_extend(
          filetypes,
          vim.treesitter.language.get_filetypes(language)
        )
      end

      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match)

          local function start()
            vim.treesitter.start(event.buf)
          end

          if
            vim.tbl_contains(nvim_treesitter.get_installed 'parsers', lang)
          then
            start()
          else
            nvim_treesitter.install(lang):await(start)
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      enable = true,
    },
    keys = {
      {
        desc = 'Toggle context',
        'yox',
        ':TSContext toggle<CR>',
        silent = true,
      },
    },
  },
}
