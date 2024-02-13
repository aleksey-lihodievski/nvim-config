-- require("dap").toggle_breakpoint()

local dapui = require("dapui")
dapui.setup()

-- setup adapters
require("dap-vscode-js").setup({
	-- debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
	-- debugger_cmd = { "js-debug-adapter" },
	-- adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },

	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug",
	-- debugger_path = "~/.local/share/nvim/site/pack/packer/opt/vscode-js-debug",
	adapters = {
		"chrome",
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
		"node",
		"chrome",
	},

	layouts = {
		elements = { "console" },
		size = 0.25, -- 25% of total lines
		position = "bottom",
	},
})

local dap = require("dap")
--
-- -- custom adapter for running tasks before starting debug
local custom_adapter = "pwa-node-custom"
dap.adapters[custom_adapter] = function(cb, config)
	if config.preLaunchTask then
		local async = require("plenary.async")
		local notify = require("notify").async

		async.run(function()
			---@diagnostic disable-next-line: missing-parameter
			notify("Running [" .. config.preLaunchTask .. "]").events.close()
		end, function()
			vim.fn.system(config.preLaunchTask)
			config.type = "pwa-node"
			dap.run(config)
		end)
	end
end

-- language config

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			request = "launch",
			name = 'Start Chrome with "localhost"',
			url = "http://localhost:3000",
			webRoot = "${workspaceFolder}",
			userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
		},
	}
end

--------------------------------------------------------------------------------

-- require("dapui").close()

require("nvim-dap-virtual-text").setup()
require("dap-go").setup()

-- vim.keymap.set("n", "<F5>", function()
-- 	require("dap").continue()
-- end)
-- vim.keymap.set("n", "<F10>", function()
-- 	require("dap").step_over()
-- end)
-- vim.keymap.set("n", "<F11>", function()
-- 	require("dap").step_into()
-- end)

vim.keymap.set("n", "<leader>sc", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<leader>so", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<leader>si", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<leader>st", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>dm", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

vim.keymap.set("n", "<Leader>dt", function()
	dapui.toggle()
end)

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
