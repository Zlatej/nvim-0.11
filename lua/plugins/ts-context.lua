return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			max_lines = 10,
			line_numbers = true,
			multiline_threshold = 3,
			on_attach = function(buf)
				local ft = vim.bo[buf].filetype
				return ft == "typescriptreact" or ft == "html" or ft == "tsx"
			end,
		})
	end,
}
