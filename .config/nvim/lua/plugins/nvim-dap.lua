return {
  'mfussenegger/nvim-jdtls',
  lazy = false,
  dependencies = {
    'mfussenegger/nvim-dap',
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

  end,
}
