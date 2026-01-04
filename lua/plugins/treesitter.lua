return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' }
        },
        config = function()
            require('nvim-treesitter').install({
                "html",
                "php",
                "javascript",
                "json",
                "typescript",
                "tsx",
                "yaml",
                "css",
                "markdown",
                "markdown_inline",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
            })
            vim.treesitter.language.register('markdown', 'octo')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        config = function()
            require('nvim-treesitter-textobjects').setup {
                select = {
                    lookahead = true,
                },
                move = {
                    set_jumps = true,
                }
            }

            vim.keymap.set({ "x", "o" }, "af", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "if", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ap", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ip", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ae", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@parenthesized_expression.outer",
                    "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "<m-f>", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "<m-F>", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "<m-p>", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "<m-P>", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "<m-e>", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@parenthesized_expression.outer",
                    "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "<m-E>", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@parenthesized_expression.outer",
                    "textobjects")
            end)
        end
    }
}
