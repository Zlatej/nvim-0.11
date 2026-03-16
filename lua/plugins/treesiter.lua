return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
        branch = "master",
		config = function()
			local configs = require("nvim-treesitter.configs")
			local default_ensure_installed = {
				"python",
				"csv",
				"css",
				"go",
				"java",
				"json",
				"objdump",
				"rust",
				"sql",
				"ssh_config",
				"xml",
				"yaml",
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"go",
				"javascript",
				"typescript",
				"tsx",
			}
			local ensure_installed = vim.g.treesitter_ensure_installed
			if ensure_installed == nil then
				ensure_installed = default_ensure_installed
			elseif type(ensure_installed) == "table" then
				if vim.tbl_isempty(ensure_installed) then
					ensure_installed = "all"
				end
			elseif type(ensure_installed) ~= "string" then
				ensure_installed = default_ensure_installed
			end
			configs.setup({
				ensure_installed = ensure_installed,
				highlight = { enable = true },
			})
		end,
	},
	{
		{
			"folke/ts-comments.nvim",
			opts = {},
			event = "VeryLazy",
			enabled = vim.fn.has("nvim-0.10.0") == 1,
		},
	},
}
