local api = vim.api

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {
  callback = function()
    vim.opt.nu = true
    vim.opt.rnu = true
  end
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {
  callback = function()
    vim.opt.nu = true
    vim.opt.rnu = false
  end
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<s-esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

vim.cmd([[
  let g:fzf_action = { "ctrl-h": "split", "ctrl-v": "vsplit" }
]])

vim.cmd([[
  hi CursorRed guifg=red guibg=red
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-CursorRed/lCursorRed,sm:block-blinkwait175-blinkoff150-blinkon175
]])

vim.cmd([[
  let g:python3_host_prog = "/usr/bin/python"
]])

vim.cmd([[
  autocmd BufEnter * set cursorline
  autocmd BufLeave * set nocursorline
]])


--vim.lsp.set_log_level("debug")
