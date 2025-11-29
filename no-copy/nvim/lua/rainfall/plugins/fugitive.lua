return {
	'tpope/vim-fugitive',
	config = function()

		vim.keymap.set("n", "<C-p>", vim.cmd.Git)     

	end

}
