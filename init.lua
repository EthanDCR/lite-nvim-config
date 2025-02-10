require("core.keymaps")
require("core.plugins")
-- require("core.plugin_config.init") -- Require the init.lua file inside plugin_config

vim.g.default_contrast_dark = 'hard'  -- Or your preferred Gruvbox settings
-- ... other Gruvbox settings ...
vim.o.background = "dark"
vim.cmd([[colorscheme default]])
