local fn = vim.fn
local cmp = require "cmp"

cmp.setup {
    -- Enables LSP snippets
    snippet = {
        expand = function(args) fn["vsnip#anonymous"](args.body) end,
    },

    -- Key mappings
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Left>"] = cmp.mapping.scroll_docs(-4),
        ["<Right>"] = cmp.mapping.scroll_docs(4),

        -- Tab Support
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        ["<Esc>"] = cmp.mapping.close(),

    },

    -- CMP Sources
    sources = {
        { name = "path" },                          -- file paths
        { name = "nvim_lsp", keyword_length = 3 },  -- from lsp server
        { name = "nvim_ls_signature_help" },        -- function sigs with current parameter emphasized
        { name = "nvim_lua", keyword_length = 2 },  -- nvim's lua runtime api (vim.lsp.*)
        { name = "buffer", keyword_length = 2 },    -- soruce current buffer
        { name = "vsnip", keyword_length = 2 },     -- nvim-cmp source for vim-vsnip
        { name = "calc" },                          -- math calculation
    },

    -- Completion window
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    -- Formatting rules
    formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = "λ",
                vsnip = "⋗",
                buffer = "Ω",
                path = "🖫",
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    }
}
