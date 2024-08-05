return {
  -- inspired by https://github.com/ibhagwan/fzf-lua
  "junegunn/fzf",
  build = "./install --bin",
  lazy = false,
  dependencies = {
    -- this will make :Files etc. work
    "junegunn/fzf.vim",
  },
  keys = {
--rg --max-depth=10 --hidden -e Lf
    {"<leader>g", ":GFiles<cr>", silent = true, desc = "Fuzzy find git files"},
    {"<leader>j", ":Files!<cr>", desc = "Fuzzy find from project root"},
    {"<leader>k", ":Files! ~<cr>", desc = "Fuzzy find from home"},
    {"<leader>l", ":Rg3<cr>", desc = "Ripgrep"},
    {"<leader>L", ":Commands!<cr>", desc = "Fuzzy find command"},
    {"<leader>;", ":Buffers!<cr>", desc = "Fuzzy find buffers"},
    {"<leader>/", ":BLines!<cr>", desc = "Fuzzy find in file"},
  },
}
