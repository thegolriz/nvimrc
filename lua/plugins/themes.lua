return {
    "bluz71/vim-moonfly-colors",
    lazy = false,  -- load immediately
    priority = 1000, -- load before other plugins
    config = function()
        vim.o.termguicolors = true

        local function ColorMyPencils(color)
            color = color or "moonfly"
            vim.cmd.colorscheme(color)
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end

        ColorMyPencils()
    end,
}
