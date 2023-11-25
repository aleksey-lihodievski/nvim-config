vim.opt.termguicolors = true

require("nvim-tree").setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 40,
	},
	diagnostics = {
		enable = true,

		show_on_dirs = true,
		-- here should be icons, this does not work

		icons = {
			-- error = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
			-- hint = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
			-- info = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
			-- warning = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
		},
		-- icons = {
		-- 	hint = "hint",
		-- 	info = "info",
		-- 	warning = "warn",
		-- 	error = "err",
		-- },
	},
})

-- local nvim_tree_events = require("nvim-tree.events")
-- local bufferline_state = require("bufferline.state")
--
-- local barbar = require("barbar-config")
--
-- local function get_tree_size()
-- 	return vim.api.nvim_win_get_width(0)
-- end
--
-- nvim_tree_events.subscribe("TreeOpen", function()
-- 	-- bufferline_state.set_offset(get_tree_size())
-- 	barbar.api.set_offset(get_tree_size())
-- end)
--
-- nvim_tree_events.subscribe("Resize", function()
-- 	-- bufferline_state.set_offset(get_tree_size())
-- 	barbar.api.set_offset(get_tree_size())
-- end)
--
-- nvim_tree_events.subscribe("TreeClose", function()
-- 	-- bufferline_state.set_offset(0)
-- 	barbar.api.set_offset(0)
-- end)

-- local view = require("nvim-tree.view")
--
-- local _M = {}
-- _M.toggle_tree = function()
-- 	if view.is_visible() then
-- 		require("nvim-tree").close()
-- 		require("bufferline.state").set_offset(0)
-- 	else
-- 		require("bufferline.state").set_offset(31, "File Explorer")
-- 		require("nvim-tree").find_file(true)
-- 	end
-- end
--
-- return _M
