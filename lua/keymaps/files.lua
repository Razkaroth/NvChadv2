local map = vim.keymap.set

map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>", { desc = "General - Save all buffers" })

map({ "n", "v" }, "<leader>G", "<cmd> LazyGit <cr>", { desc = "General - Git Alchemy" })

--#region File Navigation

-- Toggle previous & next buffers stored within Harpoon list
local harpoon = require "harpoon"
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end, { desc = "Harpoon - Previous & Next" })
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end, { desc = "Harpoon - Previous & Next" })

--#endregion
--
--#region undo & redo

map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "General - Undo Tree" })

-- scratchs
map("n", "<leader>ss", "<cmd>Scratch<cr>", { desc = "General - New Scratch" })
map("n", "<leader>sS", "<cmd>ScratchOpen<cr>", { desc = "General - Open Scratch" })
