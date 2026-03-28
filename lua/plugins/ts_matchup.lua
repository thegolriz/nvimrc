return {
    "andymass/vim-matchup",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
}
