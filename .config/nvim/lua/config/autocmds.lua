local autocmd = require('utils').autocmd

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
