require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-j>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "float", --| 'vertical' | 'tab' | 'float',
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	winbar = {
		enabled = false,
	},
	insert_mappings = true,
	terminal_mappings = true,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

