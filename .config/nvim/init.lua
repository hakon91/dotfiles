-- Keymaps is something I want everywhere
require('keymaps')

-- There is a lot of things not possible in nvim through vscode
-- So I have a special config for that
if vim.g.vscode then
    require('nvim-in-vscode')
    return
end

-- I am hoping that I won't need this separation on root level
-- Would rather do it for specific things not possible in windows
-- So the plan is to move everything to standalone (will rename later)
require('standalone')
if jit.os == 'Windows' then
    require('windows')
else
    require('hakon')
end
ColorMyPencils()
