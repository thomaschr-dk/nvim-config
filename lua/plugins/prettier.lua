return {
    'nvimtools/none-ls.nvim',
    config = function()
        require('null-ls').setup {
            sources = {
                require('null-ls').builtins.formatting.prettierd.with {
                    extra_filetypes = { 'php' }
                },
            }
        }
    end
}
