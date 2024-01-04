local fn = vim.fn
local cmd = vim.cmd
local tree = require("neo-tree")

fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })

tree.setup({
	close_if_last_window = false,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	enable_normal_mode_for_inputs = true, -- Normal mode for input dialogs.

	-- When opening, do not use windows containing these filetypes or buftypes.
	open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
	sort_case_insensitive = false, -- Used when sorting files and directories in the tree.

	-- Use a custom function for sorting files and directories.
	-- Sorts files and directories descendantly.
	sort_function = function(a, b)
		if a.type == b.type then
			return a.path < b.path
		else
			return a.type < b.type
		end
	end,

	source_selector = {
		winbar = true,
		statusline = false,
	},

	default_component_configs = {
		container = {
			enable_character_fade = true,
		},

		indent = {
			indent_size = 2,
			padding = 1, -- Extra padding on left side.

			-- Indent Guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",

			-- Expander config, needed for nesting files.
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},

		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",

			-- Next two settings are only used as a fallback.
			-- If nvim-web-devicons is installed and defaults are configured there,
			-- this will be ignored and won't be used.
			defualt = "*",
			highlight = "NeoTreeFileIcon",
		},

		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},

		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},

		git_status = {
			symbols = {
				added = "✚",
				modified = "",
				deleted = "✖",
				renamed = "󰁕",

				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},

		file_size = {
			enabled = true,
			required_width = 64,
		},

		type = {
			enabled = true,
			required_width = 120,
		},

		last_modified = {
			enabled = true,
			required_width = 64,
		},

		created = {
			enabled = true,
			required_width = 110,
		},

		symlink_target = {
			enabled = true,
		},
	},

	-- A list of functions, each representing a global custom command
	-- that will be available in all sources (if not overriden in `opts[source_name].commands`).
	-- See `:help neo-tree-custom-commands-global`.
	commands = {},

	-- Main Window
	window = {
		position = "left",
		width = 40,

		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<Space>"] = { "toggle_node", nowait = false },
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["<esc>"] = "cancel", -- Close preview or floating neo-tree window.

			["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
			["l"] = "focus_preview",

			["S"] = "split_with_window_picker", -- or "open_split"
			["s"] = "vsplit_with_window_picker", -- or "open_vsplit"

			["t"] = "open_tabnew",
			-- ["<cr>"] = "open_drop",
			-- ["t"] = "open_tab_drop",
			["w"] = "open_with_window_picker",

			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["Z"] = "expand_all_nodes",

			["a"] = { "add", config = { show_path = "relative" } },
			["A"] = { "add", config = { show_path = "relative" } },

			["d"] = "delete",
			["r"] = "rename",

			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",

			["c"] = { "copy", config = { show_path = "relative" } },
			["m"] = { "move", config = { show_path = "relative" } },

			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",

			["<"] = "prev_source",
			[">"] = "next_source",
			["i"] = "show_file_details",
		},
	},

	nesting_rules = {},
	filesystem = {
		filtered_items = {
			visible = true, -- When true, they will be displayed different than normal items.
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_hidden = false, -- Only works on Windows.
			hide_by_name = {},
			hide_by_pattern = {},
			always_show = {},
			never_show = { ".DS_Store", "thumbs.db", ".git" },
			never_show_by_pattern = {},
		},

		follow_current_file = {
			enabled = true,
			leave_dirs_open = true,
		},

		group_empty_dirs = false,
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true, -- Uses OS-level file watchers instead of nvim autocmd events.

		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["#"] = "fuzzy_sorter", -- Fuzzy sorting using the fzy algorithm.
				-- ["D"] = "fuzzy_sorter_directory",
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",

				["o"] = { "show_help", nowait = false, config = { title = "Order By", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["og"] = { "order_by_git_status", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},

			fuzzy_finder_mappings = {
				["<down>"] = "move_cursor_down",
				["<up>"] = "move_cursor_up",
			},
		},

		commands = {}, -- Add a custom command or override a global one using the same function name.
	},

	buffers = {
		-- Find and focus the file in active buffer every time the current file is changed while the tree is open.
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false, -- `false` closes auto-expanded dirs.
		},

		group_empty_dirs = true,
		show_unloaded = true,
		window = {
			position = "top",
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",

				["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},
		},
	},

	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",

				["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},
		},
	},
})

-- Setup keybinds and reveal neotree
cmd([[ nnoremap \ :Neotree reveal<cr> ]])
