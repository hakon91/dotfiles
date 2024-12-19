vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Show lsp message as a floating mesage box
vim.keymap.set("n", "<leader>em", vim.diagnostic.open_float)
-- Copy lsp message
-- This is still working progress
-- vim.api.nvim_set_keymap('n', '<leader>ec', [[:lua YankDiagnosticError()<CR>]],
--   { noremap = true, silent = true, desc = "Copy error" })

-- function YankDiagnosticError()
--   vim.diagnostic.open_float()
--   vim.diagnostic.open_float()
--   local win_id = vim.fn.win_getid()    -- get the window ID of the floating window
--   vim.cmd("normal! j")                 -- move down one row
--   vim.cmd("normal! VG")                -- select everything from that row down
--   vim.cmd("normal! y")                 -- yank selected text
--   --vim.api.nvim_win_close(win_id, true) -- close the floating window by its ID
-- end

-- greatest keymap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest keymap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
if not jit.os == 'Windows' then
    vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
end

-- Format entire file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
if not jit.os == 'Windows' then
  vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
end

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
