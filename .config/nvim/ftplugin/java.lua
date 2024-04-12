local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/nikolaj/ngr/engineer/repos/' .. project_name

local config = {
	cmd = {
    --vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/home/nikolaj/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar',
    '-configuration', '/home/nikolaj/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data', workspace_dir,
  },

	--root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  settings = {
    java = {}
  },

  init_options = {
    bundles = {
      vim.fn.glob("/home/nikolaj/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar", true)
    }
  },
}

jdtls.start_or_attach(config)
