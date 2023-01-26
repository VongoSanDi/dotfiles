local status, nt = pcall(require, "neo-tree")
if not status then return end

nt.setup {
	close_if_last_window = true,
	enable_diagnostics = false,
	popup_border_style = "rounded",
	enable_git_status = true,
	sources = {
		"filesystem",
		"buffers",
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true
		},
		renderers = {
			directory = {
				{"indent"},
				{"icon"},
				{"current_filter"},
				{"name"},
				{"clipboard"},
				{"diagnostics"}
			},
			file = {
				{"indent"},
				{"icon"},
				{"name"},
				{"clipboard"},
				{"diagnostics"}
			}
		}
	},
	window = {
		mappings = {
			["h"] = "toggle_hidden",
			["<cr>"] = "open",
			["<esc>"] = "revert_preview",
			["P"] = { "toggle_preview", config = { use_float = true } },
			["S"] = "open_split",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["w"] = "open_with_window_picker",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["a"] = {
				"add",
				-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
				-- some commands may take optional config options, see `:h neo-tree-mappings` for details
				config = {
					show_path = "none" -- "none", "relative", "absolute"
				}
			},
			["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
			["d"] = "delete",
			["r"] = "rename",
			["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
			-- ["c"] = {
			--  "copy",
			--  config = {
			--    show_path = "none" -- "none", "relative", "absolute"
			--  }
			--}
			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
		},
	},
	--[[event_handlers = {
		{ event = "neo_tree_buffer_enter",
			handler = function(_) vim.opt_local.signcolumn = "auto" end
		},]]
}
