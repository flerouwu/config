local fn = vim.fn
local cmd = vim.cmd
local diagnostic = vim.diagnostic

local function sign(opts)
    fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = "",
    })
end

sign({ name = "DiagnosticSignError", text = " " })
sign({ name = "DiagnosticSignWarn", text = " " })
sign({ name = "DiagnosticSignInfo", text = " " })
sign({ name = "DiagnosticSignHint", text = "󰌵 " })

diagnostic.config {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

cmd [[ autocmd CursorHold * lua vim.diagnostic.open_float(nul, { focusable = false }) ]]

-- Register LSP configs
local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.bashls.setup {}
