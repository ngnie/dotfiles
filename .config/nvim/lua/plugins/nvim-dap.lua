return {
  "mfussenegger/nvim-jdtls",
  lazy = false,
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "ryanoasis/vim-devicons"
  },
  config = function ()

    local status, jdtls = pcall(require, "jdtls")
    if not status then
      return
    end

    --jdtls.setup_dap({ hotcodereplace = 'auto' })

    require("dapui").setup()

    require("neodev").setup({
      library = {
        plugins = {
          "nvim-dap-ui"
        },
        types = true,
      },
    })

    vim.keymap.set("n", "<leader>co", ":copen<cr>", { desc = "Open quickfix list", silent = true  })
    vim.keymap.set("n", "<leader>cc", ":cclose<cr>", { desc = "Close quickfix list", silent = true  })

    vim.keymap.set("n", "<leader>tc", ":lua require('jdtls').test_class()<cr>", { desc = "Test class", silent = true  })
    vim.keymap.set("n", "<leader>tnm", ":lua require('jdtls').test_nearest_method()<cr>", { desc = "Test nearest method", silent = true  })
    vim.keymap.set("n", "<leader>cf", ":lua require('jdtls').compile('full')<cr>", { desc = "Compile full", silent = true  })

    vim.keymap.set("n", "<leader>duio", ":lua require('dapui').open()<cr>", { desc = "Open dapui", silent = true  })
    vim.keymap.set("n", "<leader>duic", ":lua require('dapui').close()<cr>", { desc = "Close dapui", silent = true  })
    vim.keymap.set("n", "<leader>duit", ":lua require('dapui').toggle()<cr>", { desc = "Toggle dapui", silent = true })
    vim.keymap.set("n", "<leader>de", ":lua require('dapui').eval()<cr>", { desc = "Eval dapui", silent = true  })

  end,
}
