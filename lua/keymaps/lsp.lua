-- LSP
--
local map = vim.keymap.set

map({ "n", "i", "v" }, "<A-q>", function()
  require("actions-preview").code_actions()
end, { desc = "LSP - Shows code actions menu under cursor" })

map("n", "<leader>lr", ":LspRestart<CR>", { desc = "LSP - Restart the LSP" })

map({ "n", "v" }, "<leader>ca", function()
  require("actions-preview").code_actions()
end, { desc = "LSP - Shows code actions menu under cursor", noremap = true, silent = true })

-- Typescript
--
map("n", "<leader>cd", "<cmd>VtsExec goto_source_definition<CR>", { desc = "Go to source definition" })

map("n", "<leader>cr", "<cmd>VtsExec rename_file<CR>", { desc = "LSP - Rename file" })
map("n", "<leader>co", "<cmd>VtsExec organize_imports<CR>", { desc = "LSP - Organize imports" })
map("n", "<leader>ci", "<cmd>VtsExec add_missing_imports<CR>", { desc = "LSP - Add missing imports" })
map("n", "<leader>cu", "<cmd>VtsExec remove_unused_imports<CR>", { desc = "LSP - Remove unused imports" })
map("n", "<leader>cf", "<cmd>VtsExec fix_all<CR>", { desc = "LSP - Fix all" })
map("n", "<leader>cg", "<cmd>VtsExec source_actions<CR>", { desc = "LSP - Source actions" })
map("n", "<leader>cR", "<cmd>VtsExec restart_tsserver<CR>", { desc = "LSP - Restart tsserver" })
map("n", "<leader>cV", "<cmd>VtsExec select_ts_version<CR>", { desc = "LSP - Select TS Version" })
