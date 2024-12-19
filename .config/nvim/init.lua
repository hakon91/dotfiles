require('keymaps')
if vim.g.vscode then
    require('nvim-in-vscode')
else
    if jit.os == 'Windows' then
        require('windows')
    else
        require('hakon')
    end
    ColorMyPencils()
end
