vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General vim.keymaps
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open file explorer

-- Movement/coding keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move the highlighted line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move the highlighted line down
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
if not (jit.os == 'Windows') then
  vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
end

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- Git-blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Vim REST Console
vim.keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>") -- Run REST query

-- LSP
vim.keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
vim.keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
vim.keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
vim.keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Debugging
vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
vim.keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
vim.keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
vim.keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
vim.keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

-- CMake
vim.keymap.set("n", "<C-S-B>", ":CMakeBuild<CR>")
vim.keymap.set("n", "<C-B>", ":CMakeRun<CR>")
