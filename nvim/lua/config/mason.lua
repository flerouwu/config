-- Setup Mason
local mason = require "mason"
mason.setup {
    ui = {
        icon = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
}

-- Setup LSP Config
local lsp = require "mason-lspconfig"
lsp.setup()
