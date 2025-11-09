return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<F7>', vim.cmd.UndotreeToggle)
    end
}
