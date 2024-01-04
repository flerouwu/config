local function map(modes, key, cmd)
	vim.api.nvim_set_keymap(modes, key, cmd, { noremap = true, silent = true })
end

-- Keymap
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
map("n", "<A-.>", "<Cmd>BufferNext<CR>")
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>")

-- Goto Buffers by Position
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
map("n", "<A-0>", "<Cmd>BufferLast<CR>")

map("n", "<A-p>", "<Cmd>BufferPin<CR>")
map("n", "<A-c>", "<Cmd>BufferClose<CR>")
map("n", "<C-p>", "<Cmd>BufferPick<CR>")

-- Sorting Buffers
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>")
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>")
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>")
