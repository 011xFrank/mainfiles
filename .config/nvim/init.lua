vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("config.lazy")
require("config.options")
require("config.remaps")
require("config.autocmds")

local function color_scheme(color)
    color = color or "gruvbox-material"
    vim.cmd.colorscheme (color)
end

color_scheme("gruvbox-material")

local function set_floating_window_transparency()
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local current_colorscheme = vim.g.colors_name
        if current_colorscheme == "gruvbox-material" then
            print("Gruvbox Material detected. Applying floating window transparency.")
            set_floating_window_transparency()
        end
    end
})

local current_colorscheme_on_startup = vim.g.colors_name
if current_colorscheme_on_startup == "gruvbox-material" then
    set_floating_window_transparency()
end
