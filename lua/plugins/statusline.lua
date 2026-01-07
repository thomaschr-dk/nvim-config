return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'gruvbox',
            },
            winbar = {
                lualine_b = {
                    {
                        'filename',
                        path = 1,
                    },
                },
                lualine_c = { 'filetype', 'lsp_status' }
            }
        }
    end
}
