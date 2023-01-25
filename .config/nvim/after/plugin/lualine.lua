require('lualine').setup {
    options = {
        globalstatus = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {'branch'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
    },
    winbar = {
        lualine_a = {'filename'},
        lualine_x = {'diff', 'diagnostics'},
    },
    inactive_winbar = {
        lualine_a = {'filename'},
        lualine_x = {'diff', 'diagnostics'},
    }
}

