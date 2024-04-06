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
    {"<leader>j", ":Files!<cr>", desc = "Fuzzy find from neovim root"},
    {"<leader>k", ":Files! ~<cr>", desc = "Fuzzy find from home"},
    {"<leader>l", ":Rg!<cr>", desc = "Ripgrep"},
    {"<leader>L", ":Commands!<cr>", desc = "Fuzzy find command"},
    {"<leader>/", ":BLines!<cr>", desc = "Fuzzy find in file"},
  },
}
