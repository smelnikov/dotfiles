local autocmd = require('utils').autocmd
local keymap = require('utils').keymap
local lsp_handle_capability = require('utils').lsp_handle_capability

autocmd('Setup LSP', 'LspAttach', function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)

  if client.name == 'ruff' then
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  lsp_handle_capability(event.buf, client, 'hoverProvider', function()
    keymap(
      'LSP: Hover documentation',
      'n',
      'K',
      vim.lsp.buf.hover,
      { buffer = event.buf }
    )
  end)

  lsp_handle_capability(event.buf, client, 'implementationProvider', function()
    keymap(
      'LSP: Go to implementation',
      'n',
      'gi',
      vim.lsp.buf.implementation,
      { buffer = event.buf }
    )
  end)

  if client.name == 'eslint' then
    client.server_capabilities.documentFormattingProvider = true
  end

  if client.name == 'html' then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if client.name == 'ts_ls' then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  lsp_handle_capability(
    event.buf,
    client,
    'documentFormattingProvider',
    function()
      vim.api.nvim_buf_create_user_command(event.buf, 'Format', function()
        vim.lsp.buf.format {
          bufnr = event.buf,
          filter = function(c)
            return c.supports_method 'textDocument/formatting'
          end,
        }
      end, { desc = 'Format current buffer using LSP' })

      autocmd(
        'Format file on save using LSP',
        'BufWritePre',
        'Format',
        { buffer = event.buf }
      )
    end
  )
end)

autocmd('Yadm git', { 'VimEnter', 'BufWinEnter' }, function()
  vim.fn.jobstart(
    { 'yadm', 'ls-files', '--error-unmatch', vim.fn.expand '%:p:h' },
    {
      on_exit = function(_, code, _)
        if code ~= 0 then
          return
        end
        vim.api.nvim_call_function(
          'FugitiveDetect',
          { '~/.local/share/yadm/repo.git' }
        )
      end,
    }
  )
end)

autocmd('Quit some type of buffers with <gq>', 'FileType', function(event)
  vim.bo[event.buf].buflisted = false
  vim.keymap.set('n', 'gq', ':q<CR>', { buffer = event.buf, silent = true })
end, { pattern = { 'man', 'help', 'qf', 'git' } })
