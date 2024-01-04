local formatter = require("formatter")
local fmtutil = require("formatter.util")

-- Format on save
vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { group = "__formatter__", command = ":FormatWriteLock" })

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		rust = { require("formatter.filetypes.rust").rustfmt },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		markdown = { require("formatter.filetypes.markdown").prettier },
		json = { require("formatter.filetypes.json").prettier },
		sh = { require("formatter.filetypes.sh").shfmt },
		toml = { require("formatter.filetypes.toml").taplo },
		python = { require("formatter.filetypes.python").autopep8 },
		css = { require("formatter.filetypes.css").prettier },

		-- All file types
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
