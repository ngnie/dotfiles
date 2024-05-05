return {
  "easymotion/vim-easymotion",
  lazy = false,
  keys = {
    {"<leader>f", "<Plug>(easymotion-bd-w)", desc = "Jump to character"},
    {"<leader><leader>w", "<Plug>(easymotion-overwin-w)", desc = "Jump to character (multiple window)"},
    -- {"<leader><leader>", "<Plug>(easymotion-overwin-f2)", desc = "Jump to character (???)"},
  },
}
