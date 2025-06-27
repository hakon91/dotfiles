-- Session Management
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Tabs & Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line Wrapping
vim.opt.wrap = false

-- Because I use undo-tree, backups are not needed
vim.opt.swapfile = false
vim.opt.backup = false
if jit.os == 'Windows' then
    vim.opt.undodir = vim.fn.stdpath('config') .. "/../nvim-data/undodir"
else -- I assume this will work for other operating systems (i.e. Linux and macos)
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Cursor Line
vim.opt.cursorline = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.diagnostic.config {
    float = { border = "rounded" }, -- add border to diagnostic popups
}


-- Backspace
vim.opt.backspace = "indent,eol,start"

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

vim.opt.isfname:append("@-@")

-- Consider - as part of keyword
vim.opt.iskeyword:append("-")

-- Disable the mouse while in nvim
vim.opt.mouse = ""

-- Folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Remove whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
        -- Save the current cursor position
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        -- Remove trailing whitespace
        vim.cmd([[%s/\s\+$//e]])
        -- Restore the cursor position
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})
