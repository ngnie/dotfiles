-- map to Esc
vim.keymap.set("i", "ii", "<Esc>", { desc = "Esc" })

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$")

-- TODO: Shift Enter is eaten. Fix it.
vim.keymap.set("n", "<S-CR>", "O<Esc>j")
vim.keymap.set("n", "<CR>", "o<Esc>k")

-- ThePrimeagen - block move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
