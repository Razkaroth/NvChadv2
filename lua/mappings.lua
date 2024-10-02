require "nvchad.mappings"
require "keymaps"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "k", function()
	return (vim.v.count > 0 and "k" or "gk")
end, { noremap = true, expr = true })

map("n", "j", function()
	return (vim.v.count > 0 and "j" or "gj")
end, { noremap = true, expr = true })
-- IncRename
map({ "n", "v" }, "<leader>rr", ":IncRename ", { desc = "Rename" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>")
