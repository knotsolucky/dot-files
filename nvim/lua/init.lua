-- Main Neovim configuration entry point

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.diagnostics")

-- Load lazy plugin manager
require("core.lazy")

