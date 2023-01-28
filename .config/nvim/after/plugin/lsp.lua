local lsp = require 'lsp-zero'
local builtin = require 'telescope.builtin'

lsp.preset 'recommended'

lsp.ensure_installed {
  'tsserver',
  'eslint',
  'rust_analyzer',
  'pyright',
  'sumneko_lua',
}

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

local cmp = require 'cmp'
cmp.setup {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}

lsp.set_preferences {
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I',
  },
}

lsp.on_attach(function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, remap = false, desc = desc }
  end

  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover()
  end, opts 'Hover Documentation')
  vim.keymap.set('n', '<leader>fr', function()
    vim.lsp.buf.references()
  end, opts '[F]ind [R]eferences')
  vim.keymap.set('n', '<leader>rn', function()
    vim.lsp.buf.rename()
  end, opts '[R]e[n]ame')
  vim.keymap.set(
    'n',
    '<leader>ws',
    builtin.lsp_dynamic_workspace_symbols,
    opts '[W]orkspace [S]ymbols'
  )
  vim.keymap.set(
    'n',
    '<leader>ds',
    builtin.lsp_document_symbols,
    opts '[D]ocument [S]ymbols'
  )
end)

lsp.setup()

require('mason-null-ls').setup {
  ensure_installed = {
    'black',
    'isort',
    'prettierd',
    'stylua',
  },
}

local null_ls = require 'null-ls'
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

vim.diagnostic.config {
  virtial_text = true,
}
