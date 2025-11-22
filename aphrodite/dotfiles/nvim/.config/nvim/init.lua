-- basic stuff

-- config
require("config.lazy")
require("config.keys")

-- plugins
require('mini.completion').setup()
require('lualine').setup()

vim.lsp.enable({'gopls'})
