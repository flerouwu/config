local lualine = require("lualine")

-- Init lualine
lualine.setup({
	options = {
		theme = "auto",

		-- Disable component separators
		component_separators = "",
	},
	sections = {
		-- Component Positions
		-- CENTER is handled by the X component.
		-- +------------------------------------+
		-- | A | B | C      CENTER <- X | Y | Z |
		-- +------------------------------------+

		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { "location", "selectioncount", "searchcount" },

		lualine_x = {
			-- Middle Section
			{
				function()
					local msg = "No Active LSP"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")

					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end

					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end

					return msg
				end,
				icon = "  LSP:",
				color = { gui = "bold" },
			},

			-- The magical text.
			-- It's what centers the above components.
			{
				function()
					return "%="
				end,
			},

			{
				"diagnostic",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
			},
			{ "encoding" },
			{ "fileformat", icons_enabled = false },
		},
		lualine_y = { "filetype" },
		lualine_z = { "diff", "branch" },
	},
})
