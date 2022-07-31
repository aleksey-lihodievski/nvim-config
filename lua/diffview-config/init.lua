require("diffview").setup({
	diffopt = "horizontal",
	-- diff_binaries = false, -- Show diffs for binaries
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
	-- git_cmd = { "git" }, -- The git executable followed by default args.
	use_icons = true, -- Requires nvim-web-devicons
	file_panel = {
		listing_style = "list", -- One of 'list' or 'tree'
		tree_options = { -- Only applies when listing_style is 'tree'
			flatten_dirs = true, -- Flatten dirs that only contain one single dir
			folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
		},
		win_config = { -- See ':h diffview-config-win_config'
			position = "bottom",
			height = 15,
		},
	},
	file_history_panel = {
		log_options = { -- See ':h diffview-config-log_options'
			single_file = {
				diff_merges = "combined",
			},
			multi_file = {
				diff_merges = "first-parent",
			},
		},
		win_config = { -- See ':h diffview-config-win_config'
			position = "bottom",
			height = 16,
		},
	},
})
