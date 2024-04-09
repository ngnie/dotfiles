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
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- will put delay on "j" in lf
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

-- vim.cmd([[
--   highlight Cursor guibg=#5f87af ctermbg=67
--   highlight iCursor guibg=#ffffaf ctermbg=229
--   highlight rCursor guibg=#d70000 ctermbg=124
--   set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver100-iCursor,r-cr:block-rCursor,o:hor50-Cursor/lCursor,sm:block-iCursor,a:blinkwait1000-blinkon500-blinkoff250
-- ]])

-- vim.cmd([[
--   highlight Cursor guifg=white guibg=black
--   highlight iCursor guifg=white guibg=steelblue
--   set guicursor=n-v-c:block-Cursor
--   set guicursor+=i:ver100-iCursor
--   set guicursor+=n-v-c:blinkon0
--   set guicursor+=i:blinkwait10
-- ]])

-- require("shade").setup({
--   overlay_opacity = 50,
--   opacity_step = 1,
--   keys = {
--     brightness_up    = '<C-Up>',
--     brightness_down  = '<C-Down>',
--     toggle           = '<Leader>s',
--   }
-- })

-- vim.cmd([[let g:airline_theme='one']])
--
--vim.cmd([[
--  let g:vimade = {}
--  let g:vimade.fadelevel = 0.5
--  let g:vimade.enablesigns = 1
--]])
--
--
--
