return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "eslint",
            },
        })

        --  Configure Lua LS
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    },
                },
            },
        })

        -- Configure ts_ls
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })

        -- Configure ESLint
        vim.lsp.config("eslint", {
            root_dir = vim.fs.root(0, {
                "eslint.config.js",
                ".eslintrc",
                ".eslintrc.js",
                ".eslintrc.json",
                "package.json",
                ".git",
            }),
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
        })

        --  Enable them
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("eslint")

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
