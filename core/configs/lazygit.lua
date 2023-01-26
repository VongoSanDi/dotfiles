--local ok, lazygit = pcall(require, "lazygit")
--if not ok then return end

--lazygit.setup {}

vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>")
