return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        lazy = false,

        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c", "cpp", "lua", "vim", "vimdoc", "query",
                    "markdown", "markdown_inline", "python", "javascript", "tsx"
                },
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        return ok and stats and stats.size > max_filesize
                    end,
                },

                indent = {
                    enable = true
                },
            })
        end,
    },

    {
        "nvim-treesitter/playground",
        lazy = false,
    },
}
