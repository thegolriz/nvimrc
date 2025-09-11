vim.g.mapleader = " "
require("golriz.options")
require("golriz.keymaps")
require("golriz.lazy")
require("golriz.telescope")
require("golriz.themes")
require("golriz.harpoon")
require("golriz.undotree")
-- enable persistent undo
vim.opt.undofile = true

-- pick a place to store undo history
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(vim.o.undodir, "p")
