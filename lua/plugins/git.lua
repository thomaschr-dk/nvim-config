return {
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                on_attach = function()
                    vim.keymap.set("n", "<leader>gp", function()
                        require("gitsigns").preview_hunk()
                    end, { remap = false, desc = "Preview git hunk", buffer = true })
                    vim.keymap.set("n", "<leader>gb", function()
                        require("gitsigns").blame()
                    end, { remap = false, desc = "View git blame", buffer = true })
                end
            }
        end
    }
}
