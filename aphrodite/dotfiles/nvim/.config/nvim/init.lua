-- basic stuff

-- config
require("config.lazy")
require("config.keys")
require("config.line-numbers")
require("config.harpoon")

-- plugins
require('mini.completion').setup()
require('lualine').setup()

vim.lsp.enable({'gopls'})
