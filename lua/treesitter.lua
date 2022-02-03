if vim.g.loaded_nvim_treesitter then
require('nvim_treesitter')
vim.o.foldmethod = 'expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'

--Incremental selection
require'nvim-treesitter.configs'.setup {
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "g<CR>",
		},
	},
}
end