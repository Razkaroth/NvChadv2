require "nvchad.mappings"
require "keymaps"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- IncRename
map({ "n", "v" }, "<leader>rr", ":IncRename ", { desc = "Rename" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>")
