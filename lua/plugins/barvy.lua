return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	priority = 1000,
	-- 	name = "rose-pine",
	-- 	init = function()
	-- 		vim.cmd.colorscheme("rose-pine-dawn")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- 	init = function()
	-- 		-- vim.cmd.colorscheme("kanagawa-wave")
	-- 		vim.cmd.colorscheme("kanagawa-dragon")
	-- 		-- vim.cmd.colorscheme("kanagawa-lotus")
	-- 	end,
	-- },
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
			})
			vim.cmd.colorscheme("vague")
		end,
	},
}
