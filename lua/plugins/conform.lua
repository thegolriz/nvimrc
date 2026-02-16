return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
            },
            format_on_save = {
                lsp_format = false,
                timeout_ms = 500,
            },
            default_format_opts = {
                lsp_format = false,
            },
        })
        vim.keymap.set("n", "<leader>f", function()
            require("conform").format()
        end)
    end,
}
