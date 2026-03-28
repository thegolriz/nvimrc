return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- if you're using v2
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add to harpoon list" })

        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open harpoon list" })

        vim.keymap.set("n", "<C-y>", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon switch to item 1" })

        vim.keymap.set("n", "<C-u>", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon switch to item 2" })

        vim.keymap.set("n", "<C-i>", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon switch to item 3" })

        vim.keymap.set("n", "<C-p>", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon switch to item 4" })

        vim.keymap.set("n", "<C-S-P>", function()
            harpoon:list():prev()
        end, { desc = "Harpoon go prev" })

        vim.keymap.set("n", "<C-S-N>", function()
            harpoon:list():next()
        end, { desc = "Harpoon go next" })
    end,
}
