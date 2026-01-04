require("config.lazy")

-- {{{ Commands
vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.cmd [[set clipboard+=unnamedplus]]
vim.cmd [[set shiftwidth=4]]
-- }}}

--- {{{ Options
vim.opt.relativenumber = true
vim.opt.foldmethod = "marker"
--- }}}

--- {{{ Globals
vim.g.mapleader = " "
vim.g.clipboard = "pbcopy"
--- }}}

--- {{{ Insert keymaps
vim.keymap.set('i', 'jk', '<esc>', { noremap = true })
--- }}}

--- {{{ Normal keymaps
vim.keymap.set('n', '<leader>ec', ':vsplit $MYVIMRC <cr>', { noremap = true, desc = "Edit config" })
vim.keymap.set('n', '<leader>sc', ':source $MYVIMRC <cr>', { noremap = true, desc = "Source config" })
vim.keymap.set('n', '<leader>qc', ':cclose <cr>', { noremap = true, desc = "Close quickfix window" })
vim.keymap.set('n', '<leader>h', ':nohlsearch <cr>', { noremap = true, desc = "clear search highlights" })
vim.keymap.set('n', '<leader>qn', ':cnext <cr>', { noremap = true })
vim.keymap.set('n', '<leader>qp', ':cprevious <cr>', { noremap = true })
vim.keymap.set('n', '<leader>st', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 15)
end, { noremap = true, desc = 'Open terminal in new window' })
--- {{{ Quickfix keymaps
vim.keymap.set('n', '<M-j>', ':cnext <cr>', { noremap = true })
vim.keymap.set('n', '<M-k>', ':cprev <cr>', { noremap = true })
vim.api.nvim_create_user_command('ToggleQuickfix', function()
    if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
        vim.cmd('copen')
    else
        vim.cmd('cclose')
    end
end
, {})
vim.keymap.set('n', '<M-c>', ':ToggleQuickfix <cr>', { noremap = true })
--- }}}

vim.keymap.set({ 'n', 'v' }, '<leader>x', ':lua <cr>', { noremap = true })
--- }}}

--- {{{ Diagnostics
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true }, })
--- }}}

--- {{{ Autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('tc-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end
})
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('tc-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})
--- {{{ Abbreviations (PHP)
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = '*.php',
    command = 'abbreviate pubf public<space>function()'
})
--- }}}
