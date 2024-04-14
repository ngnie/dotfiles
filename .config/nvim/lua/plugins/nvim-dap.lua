return {
  "mfussenegger/nvim-dap",
  lazy = false,
  dependencies = {
    "mfussenegger/nvim-jdtls",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "ryanoasis/vim-devicons"
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

    require("dapui").setup()

    require("neodev").setup({
      library = {
        plugins = {
          "nvim-dap-ui"
        },
        types = true,
      },
    })

    vim.keymap.set("n", "<leader>duio", ":lua require('dapui').open()<cr>", { desc = "Open dapui" })
    vim.keymap.set("n", "<leader>duic", ":lua require('dapui').close()<cr>", { desc = "Close dapui" })
    vim.keymap.set("n", "<leader>duit", ":lua require('dapui').toggle()<cr>", { desc = "Toggle dapui" })
    vim.keymap.set("n", "<leader>de", ":lua require('dapui').eval()<cr>", { desc = "Eval dapui" })

  end,
}
