vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>c1", function() vim.cmd.colorscheme("gruvbox") end, { desc = "Theme: gruvbox" })
vim.keymap.set("n", "<leader>c2", function() vim.cmd.colorscheme("ayu-mirage") end, { desc = "Theme: ayu mirage" })
vim.keymap.set("n", "<leader>c3", function() vim.cmd.colorscheme("cyberdream") end, { desc = "Theme: cyberdream" })
vim.keymap.set("n", "<leader>c4", function() vim.cmd.colorscheme("gruber-darker") end, { desc = "Theme: gruber" })
