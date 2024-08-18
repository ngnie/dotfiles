-- map Esc
vim.keymap.set("i", "ii", "<Esc>", { desc = "Esc" })

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$")

-- Shift + Enter and Shift + Ctrl has special handing in alacritty.toml
vim.keymap.set("n", "<CR>", "O<Esc>j")
vim.keymap.set("n", "<S-CR>", "o<Esc>k")

-- ThePrimeagen - block move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Use "h" for horizontal instead of "s" for "split"
vim.keymap.set("n", "<C-w>h", "<C-w>s", { silent = true })

-- resize window
vim.keymap.set("n", "<C-A-h>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-j>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-k>", ":resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-A-l>", ":vertical resize +5<CR>", { silent = true })

-- change directory
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:h<CR>", { silent = true })


local function get_spring_boot_runner(profile, debug)
  local debug_param = ""

  if debug then
    debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
  end

  local profile_param = ""
  if profile then
    profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
  end

  return 'mvn spring-boot:run ' .. profile_param .. debug_param

end


local function debug_open_centered_scopes()
  local widgets = require'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end


local function attach_to_debug()
  local dap = require('dap')
  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Attach to the process";
      hostName = 'localhost';
      port = '5005';
    },
  }

  dap.continue()

end

local function bufOnly()
  vim.cmd [[%bdelete|edit #|normal`"]]
end

vim.keymap.set('n', '<leader>bo', function() bufOnly() end, { desc = 'Delete other buffers but current' })


vim.keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<cr>', { desc = 'Debug toggle breakpoint' })
vim.keymap.set('n', '<leader>da', function() attach_to_debug() end, { desc = 'Debug attach' })
vim.keymap.set('n', '<leader>ds', function() debug_open_centered_scopes() end, { desc = 'Debug centered scopes' })
vim.keymap.set('n', '<leader>dc', ':lua require"dap".continue()<cr>', { desc = 'Debug continue' })
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<cr>', { desc = 'Debug repl open' })
vim.keymap.set('n', '<leader>dov', ':lua require"dap".step_over()<cr>', { desc = 'Debug step over' })
vim.keymap.set('n', '<leader>din', ':lua require"dap".step_into()<cr>', { desc = 'Debug step into' })
vim.keymap.set('n', '<leader>dou', ':lua require"dap".step_out()<cr>', { desc = 'Debug step out' })

