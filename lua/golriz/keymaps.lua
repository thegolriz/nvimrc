--, remap space as leader just in case

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explore" })
vim.keymap.set("n", "<leader>so", function()
    local name = vim.fn.expand("%:r"):gsub(".*/lua/", ""):gsub("/", ".")
    if name == "" then
        print(" Not a valid Lua module.")
        return
            n
    end
    package.loaded[name] = nil
    require(name)
    print(" Reloaded: " .. name)
end, { desc = "Reload current Lua module" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Copy/close undotree" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>r", function()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
    else
        vim.wo.relativenumber = true
    end
end, { desc = "Toggle relative numbers" })
