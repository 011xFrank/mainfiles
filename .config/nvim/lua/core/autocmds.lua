local api = vim.api

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
        { "BufRead", "BufNewFile" },
        {
                pattern = { "*.txt", "*.md", "*.tex" },
                callback = function()
                        vim.opt.spell = true
                        vim.opt.spelllang = "en,de"
                end,
        }
)

-- When you open a file, you will be at the last position
api.nvim_create_autocmd(
        "BufReadPost",
        {
                callback = function()
                        local mark = vim.api.nvim_buf_get_mark(0, '"')
                        local lcount = vim.api.nvim_buf_line_count(0)
                        if mark[1] > 0 and mark[1] <= lcount then
                                pcall(vim.api.nvim_win_set_cursor, 0, mark)
                        end
                end,
        }
)

-- Show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })

api.nvim_create_autocmd(
        { "InsertLeave", "WinEnter" },
        { pattern = "*", command = "set cursorline", group = cursorGrp, }
)
api.nvim_create_autocmd(
        { "InsertEnter", "WinLeave" },
        { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- highlight on yank
api.nvim_create_autocmd(
        "TextYankPost",
        {
                callback = function()
                        vim.hl.on_yank()
                end,
        }
)

api.nvim_create_autocmd("VimEnter", {
        callback = function()
                vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })
        end
})


--- Lua
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'TextChanged', 'TextChangedP' }, {
        pattern = '*',
        callback = function()
                vim.cmd('silent! write')
        end
})

-- Resize splits when the window is resized
api.nvim_create_autocmd("VimResized", {
        pattern = "*",
        command = "wincmd =",
})
