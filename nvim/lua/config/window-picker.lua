local picker = require "window-picker"

picker.setup {
	filter_rules = {
		include_current_win = false,
		autoselect_one = true,

		-- Filter using buffer options.
		bo = {
			filetype = { "neo-tree", "neo-tree-popup", "notify" }, -- Ignore file types
			buftype = { "terminal", "quickfix" }, -- Ignore buffer types
		},
	}
}
