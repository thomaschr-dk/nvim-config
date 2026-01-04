return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
        config = function()
            local oil = require('oil')
            oil.setup()
            vim.keymap.set('n', '<leader>of', function() oil.open() end,
                { noremap = true, desc = "Open Oil in buffer's directory" })
            vim.keymap.set('n', '<leader>od', function() oil.open('.') end,
                { noremap = true, desc = "Open Oil in current working directory" })
        end
    }
}
