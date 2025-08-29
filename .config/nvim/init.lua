require("core")

local function color_scheme(color)
    color = color or "gruvbox-material"
    vim.cmd.colorscheme(color)
end

-- color_scheme("gruvbox-material")
-- color_scheme("everforest")
color_scheme("ash")
-- color_scheme("vague")
-- color_scheme("rose-pine-moon")
-- color_scheme("kanagawa-paper-ink")
-- color_scheme("catppuccin")

local current_colorscheme_on_startup = vim.g.colors_name
if current_colorscheme_on_startup == "gruvbox-material" then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
end

-- Set StatusLine background to none
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
-- Set StatusLineNC (non-current window statusline) background to none
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local current_colorscheme = vim.g.colors_name
        if current_colorscheme == "gruvbox-material" then
            print("Gruvbox Material detected. Applying floating window transparency.")
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        end
    end
})
