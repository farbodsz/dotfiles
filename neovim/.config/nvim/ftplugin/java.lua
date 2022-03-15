-------------------------------------------------------------------------------
-- nvim-jdtls config
-------------------------------------------------------------------------------

local home = os.getenv("HOME")
local jdtls_home = os.getenv("JDTLS_HOME")

local root_markers = { ".git", "mvnw", "gradlew" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local workspace_folder = home
  .. "/.workspace/"
  .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java", -- Path to java (unless in path)

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- Path to JDTLS install location and version of plugin
    "-jar",
    jdtls_home
      .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",

    -- OS configuration
    "-configuration",
    jdtls_home .. "/config_linux",

    -- eclipse.jdt.ls stores project specific data within a folder set by this
    -- flag. Use dedicated directory per project:
    "-data",
    workspace_folder,
  },

  root_dir = require("jdtls.setup").find_root({}),

  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {},

  -- `bundles` are paths to jars of additional eclipse.jdt.ls plugins.
  -- E.g. https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  init_options = {
    bundles = {},
  },

  on_attach = function(client, bufnr)
    require("jdtls.setup").add_commands()
    require("farbodsz.lsp.config").on_attach(client, bufnr)
  end,
}

-- Starts new client and server, or attach to an existing client and server
require("jdtls").start_or_attach(config)
