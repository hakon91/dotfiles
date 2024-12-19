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
