local toggleterm = require("toggleterm")

toggleterm.setup({
	open_mapping = "<C-`>",
	autochdir = true,
	terminal_mappings = true,
	insert_mappings = false,

	winbar = {
		enabled = true,
		name_formatter = function(term)
			return term.name
		end,
	},
})
