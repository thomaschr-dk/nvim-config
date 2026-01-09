return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    config = function()
        require('telescope').setup {
            defaults = require('telescope.themes').get_dropdown(),
            extensions = {
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')

        vim.keymap.set('n', '<leader>ff',
            function() require('telescope.builtin').find_files() end,
            { noremap = true, desc = "Search files" })
        vim.keymap.set('n', '<leader>fb',
            function() require('telescope.builtin').buffers { sort_mru = true } end,
            { noremap = true, desc = "Search buffers" })
        vim.keymap.set('n', '<leader>fg',
            function() require('telescope.builtin').live_grep() end,
            { noremap = true, desc = "Grep files" })
        vim.keymap.set('n', '<leader>fc',
            function() require('telescope.builtin').git_status() end,
            { noremap = true, desc = "Find modified files (git)" })
        vim.keymap.set('n', '<leader>fp',
            function() require('telescope.builtin').resume() end,
            { noremap = true, desc = "Resume previous picker" })
        vim.keymap.set('n', '<leader>fh',
            function() require('telescope.builtin').help_tags() end, { noremap = true, desc = "Search help tags" })
        vim.keymap.set('n', '<leader>fn', function()
            require('telescope.builtin').find_files {
                cwd = vim.fn.stdpath('config')
            }
        end, { noremap = true, desc = "Search nvim config" })
        vim.keymap.set('n', '<leader>fr', function()
            require('telescope.builtin').lsp_references()
        end, { noremap = true, desc = "Search LSP references under cursor" })
        vim.keymap.set('n', '<leader>fs', function()
            require('telescope.builtin').lsp_document_symbols()
        end, { noremap = true, desc = "Search LSP document symbols" })
    end
}
