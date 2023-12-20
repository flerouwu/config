-- Plugin are handled with packer.nvim:
-- 	https://github.com/wbthomason/packer.nvim
--
-- Packer will be automatically cloned if it isn't installed.
local api = vim.api
local cmd = vim.cmd

local utils = require "utils"
local needs_sync = utils:ensure_packer()

cmd [[ packadd packer.nvim ]] -- load packer
local packer = require "packer"

return packer.startup(function(use)
	use "wbthomason/packer.nvim"
    use "wakatime/vim-wakatime"
    
    use { "NeogitOrg/neogit", requires = { "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" }, config = function() require "config.neogit" end }
	use "rstacruz/vim-closer" -- Autoclose Brackets
	use "folke/tokyonight.nvim" -- Tokyo Night Theme
	use "mrhh69/nvim-kitty" -- Kitty Config Highlighting

	-- Mason for LSP, Formatters, Linters, etc.
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	require "config.mason"

    -- LSP
    use "neovim/nvim-lspconfig"
    use { "simrat39/rust-tools.nvim", config = function() require "config.rust-tools" end }

    -- Common Sources
    use "hrsh7th/nvim-cmp" -- Completion Framework
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/vim-vsnip"
    require "config.cmp"
	
	-- Status Bar
	use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" }, config = function() require "config.lualine" end }

	-- File Tree
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
			{
				"s1n7ax/nvim-window-picker", verison = "2.*",
				config = function() require "config.window-picker" end,
			}
		},
		config = function() require "config.neo-tree" end,
	}


	-- If packer was just installed, synchronise plugins
	if needs_sync then
		api.nvim_echo({ { "packer.nvim needs to sync", "Title" } }, true, {})
		packer.sync()
	end
end)
