local cmd = vim.cmd
local api = vim.api
local opt = vim.opt

-- Gray Cursor Line
opt.cursorline = true
cmd [[ hi CursorLine term=bold cterm=bold guibg=Grey50 ]]

-- Adjust Cursor - See :help guicursor
opt.guicursor = "a:ver10"

-- Load Colour Scheme
cmd [[ color tokyonight-night ]]
cmd [[ colorscheme tokyonight-night ]]

-- Enable Line Numbers
opt.number = true

-- Formatting
-- Follows https://github.com/flerouwu/prettier-config
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.scrolloff = 10
opt.incsearch = true


-- completion experience stuff
--      :help completeopt
opt.completeopt = {"menuone", "noselect", "noinsert"}
opt.shortmess = opt.shortmess + { c = true }
opt.signcolumn = "yes"
opt.updatetime = 300
