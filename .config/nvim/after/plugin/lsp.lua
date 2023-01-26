local lsp = require "lsp-zero"
local builtin = require 'telescope.builtin'

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'pyright',
    'sumneko_lua',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local function opts (desc)
        return { buffer = bufnr, remap = false, desc = desc }
    end

    vim.keymap.set(
        "n", "K", function() vim.lsp.buf.hover() end,
        opts("Hover Documentation")
    )
    vim.keymap.set(
        "n", "<leader>fr", function() vim.lsp.buf.references() end,
        opts("[F]ind [R]eferences")
    )
    vim.keymap.set(
        "n", "<leader>rn", function() vim.lsp.buf.rename() end,
        opts("[R]e[n]ame")
    )
    vim.keymap.set(
        "i", "<leader>ws", builtin.lsp_dynamic_workspace_symbols,
        opts("[W]orkspace [S]ymbols")
    )
    vim.keymap.set(
        "i", "<leader>ds", builtin.lsp_document_symbols,
        opts("[D]ocument [S]ymbols")
    )

end
)

lsp.setup()

vim.diagnostic.config ({
    virtial_text = true,
})

