local data_path = vim.fn.stdpath("data")
local lazypath = data_path .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Cloning Lazy.nvim...")
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    { import = "plugins",},
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>se", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
            {"<leader>fe", function() require("telescope.builtin").diagnostics({bufnr = 0}) end, desc = "Local file diagnostics"},
        },
        config = function()
            require("telescope").setup({})
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        lazy= false,
        priority = 1000,
        config = function()
            require("golriz.themes")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter", 
        branch = "master", 
        lazy = false, 
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c", "cpp", "lua", "vim", "vimdoc", "query",
                    "markdown", "markdown_inline", "python", "javascript","tsx"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        return ok and stats and stats.size > max_filesize
                    end,
                },
                indent = {
                    enable = true
                },
            })
        end
    },
    {
        "nvim-treesitter/playground",
        lazy = false
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("golriz.harpoon")
        end
    },
    {
        "ThePrimeagen/vim-be-good",
        lazy = false
    },
    {
        "mbbill/undotree"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
	    "L3MON4D3/LuaSnip",
	    -- follow latest release.
	    version = "v2.4.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	    -- install jsregexp (optional!).
	    build = "make install_jsregexp"
    },
    {
        "rafamadriz/friendly-snippets",
        dependencies = { "L3MON4D3/LuaSnip" },
    },
    {
        "stevearc/conform.nvim",
          opts = {},
    },


})

