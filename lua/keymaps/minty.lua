

local map = vim.keymap.set


map("n", "<leader>cp", function()
require("minty.huefy").toggle()
end, { desc = "Minty - Toggle" })

map("n", "<leader>cP", function()
require("minty.shades").toggle()
end, { desc = "Minty - Cycle" })
