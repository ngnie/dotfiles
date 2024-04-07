local api = vim.api

-- api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {command = [[ set relativenumber ]]})
-- api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {command = [[ set norelativenumber ]]})

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {
  callback = function()
    vim.opt.nu = true
    vim.opt.rnu = true
  end
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {
  callback = function()
    vim.opt.nu = false
    vim.opt.rnu = false
  end
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

-- vim.cmd([[let g:airline_theme='one']])

