return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            config = {
                week_header = { enable = true }
            }
        }
        vim.keymap.set('n', '<leader>d', ':Dashboard <cr>', { noremap = true, desc = "Open dashboard" })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
