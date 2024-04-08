-- map to Esc
--
vim.keymap.set("i", "ii", "<Esc>", { desc = "Esc" })

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$")

-- Shift + Enter and Shift + Ctrl has special handing in alacritty.toml
vim.keymap.set("n", "<S-CR>", "O<Esc>j")
vim.keymap.set("n", "<CR>", "o<Esc>k")

-- ThePrimeagen - block move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- git files
vim.keymap.set("n", "<leader>gf", ":GitFiles<CR>", { silent = true })

-- show buffers
vim.keymap.set("n", "<leader>bu", ":Buffers!<CR>")

vim.keymap.set("n", "<C-w>h", "<C-w>s", { silent = true })

-- resize window
vim.keymap.set("n", "<C-A-h>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-j>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-k>", ":resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-l>", ":vertical resize +5<CR>", { silent = true })

-- change directory
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:h<CR>", { silent = true })

--vim.keymap.set("n", "<leader>y", '"+y<CR>', { silent = true })
--vim.keymap.set("n", "<leader>p", '"+p<CR>', { silent = true })
