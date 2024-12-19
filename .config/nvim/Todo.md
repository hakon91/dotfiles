# Things to explore or look into

1. Quicklist. What is it? Is it useful
    I found someone's keymaps:
    -- Quickfix vim.keymaps
    vim.keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
    vim.keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
    vim.keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
    vim.keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
    vim.keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
    vim.keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

    and some plugin in a file called quickfixdd.lua:
    -- Adds delete functionality to quickfix list (keymap dd)
    return {
      -- https://github.com/TamaMcGlinn/quickfixdd
      'TamaMcGlinn/quickfixdd',
      event = 'VeryLazy'
    }
2. Found some diff keymaps. What is that?
    -- Diff vim.keymaps
    vim.keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
    vim.keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
    vim.keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
    vim.keymap.set("n", "<leader>cn", "]c") -- next diff hunk
    vim.keymap.set("n", "<leader>cp", "[c") -- previous diff hunk
3. Should I use some of these keymaps for telescope?
    -- Telescope
    vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, {})
    vim.keymap.set('n', '<leader>pg', require('telescope.builtin').live_grep, {})
    vim.keymap.set('n', '<leader>pfs', require('telescope.builtin').current_buffer_fuzzy_find, {})
    vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})
    vim.keymap.set('n', '<leader>h', require('telescope.builtin').help_tags, {})
    vim.keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {})
    vim.keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {})
    vim.keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end)
    -- Might add later if it will be useful
    -- vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
