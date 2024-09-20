local map = vim.keymap.set
-- LSP
--
map({ "n", "i", "v" }, "<A-q>", function()
  require("actions-preview").code_actions()
end, { desc = "LSP - Shows code actions menu under cursor" })
map("n", "<leader>lr", ":LspRestart<CR>", { desc = "LSP - Restart the LSP" })

map({ "n", "v" }, "<leader>ca", function()
  require("actions-preview").code_actions()
end, { desc = "LSP - Shows code actions menu under cursor", noremap = true, silent = true })
