require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-/>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "horizontal", --| 'vertical' | 'tab' | 'float',
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	winbar = {
		enabled = false,
	},
})
