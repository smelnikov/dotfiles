local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

local bin_name = 'ride-language-server'
local cmd = { bin_name, '--stdio' }

if not configs.foo_lsp then
  configs.ride_ls = {
    default_config = {
      cmd = cmd,
      filetypes = { 'ride' },
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end,
    },
  }
end

lspconfig.ride_ls.setup {}

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*.ride',
  callback = function()
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
