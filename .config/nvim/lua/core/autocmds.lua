local api = vim.api

api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {command = [[ set relativenumber ]]})
api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {command = [[ set norelativenumber ]]})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})
