return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('gruvbox').setup {
            dim_inactive = true
        }
        vim.cmd [[colorscheme gruvbox]]
    end
}
