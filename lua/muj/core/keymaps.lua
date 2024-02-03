vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>q", ":wqa<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>qf", ":qa!<CR>")

keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")

keymap.set({"i", "n"}, "<leader>sl", [[<C-w>h]])
keymap.set({"i", "n"}, "<leader>su", [[<C-w>j]])
keymap.set({"i", "n"}, "<leader>sr", [[<C-w>l]])
keymap.set({"i", "n"}, "<leader>sd", [[<C-w>k]])

-- tab maximizer (need maximizer plugin enaabled)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
