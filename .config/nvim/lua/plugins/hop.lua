return {
  "phaazon/hop.nvim",
  branch = 'v2',
  lazy = true,
  keys = {
    { "<leader>f", ":HopWord<cr>", desc = "Jump to word", silent = true },
  },
  config = function()
    require'hop'.setup {
      quit_key = '<Esc>',
      jump_on_sole_occurrence = true,
      case_insensitive = false,
      multi_windows = true,
    }

    --vim.cmd("hi HopNextKey guifg=#ff9900")
    --vim.cmd("hi HopNextKey1 guifg=#ff9900")
    --vim.cmd("hi HopNextKey2 guifg=#ff9900")

  end
}
