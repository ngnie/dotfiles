return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function ()
    --require('dap').setup({})
    --require('nvim-dap-ui').setup({})
    --

    local status, jdtls = pcall(require, "jdtls")
    if not status then
      return
    end

    jdtls.setup_dap({ hotcodereplace = 'auto' })

    vim.keymap.set('n', '<leader>ds', ':lua debug_open_centered_scopes()<cr>', { desc = 'Debug open centered scopes' })
    vim.keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<cr>', { desc = 'Toggle breakpoint' })
    vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<cr>', { desc = 'Repl open' })

  end,
}
