-- remap space as leader just in case

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>so", function()
  local name = vim.fn.expand("%:r"):gsub(".*/lua/", ""):gsub("/", ".")
  if name == "" then
    print("❌ Not a valid Lua module.")
    return
  end
  package.loaded[name] = nil
  require(name)
  print("✅ Reloaded: " .. name)
end, { desc = "Reload current Lua module" })
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n","<leader>u", vim.cmd.UndotreeToggle)

