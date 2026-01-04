return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    config = function()
        require('telescope').setup {
            defaults = require('telescope.themes').get_ivy(),
            extensions = {
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')

        vim.keymap.set('n', '<leader>tf',
            function() require('telescope.builtin').find_files() end,
            { noremap = true, desc = "Search files" })
        vim.keymap.set('n', '<leader>tg',
            function() require('telescope.builtin').live_grep() end,
            { noremap = true, desc = "Grep files" })
        vim.keymap.set('n', '<leader>th',
            function() require('telescope.builtin').help_tags() end, { noremap = true, desc = "Search help tags" })
        vim.keymap.set('n', '<leader>tn', function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath('config')
            }
        end, { noremap = true, desc = "Search nvim config" })
        vim.keymap.set('n', '<leader>tr', function()
            require('telescope.builtin').lsp_references()
        end, { noremap = true, desc = "Search LSP references under cursor" })
        vim.keymap.set('n', '<leader>ts', function()
            require('telescope.builtin').lsp_document_symbols()
        end, { noremap = true, desc = "Search LSP document symbols" })
    end
}
