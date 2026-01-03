local M = {}

function M.keymap(desc, modes, lhs, rhs, opts)
  opts = opts or {}
  opts.desc = desc

  vim.keymap.set(modes, lhs, rhs, opts)
end

local group = vim.api.nvim_create_augroup('config', { clear = true })

function M.autocmd(desc, event, callbackOrCommand, opts)
  opts = opts or {}
  opts.desc = desc
  opts.group = group

  if type(callbackOrCommand) == 'string' then
    opts.command = callbackOrCommand
  else
    opts.callback = callbackOrCommand
  end

  vim.api.nvim_create_autocmd(event, opts)
end

return M
