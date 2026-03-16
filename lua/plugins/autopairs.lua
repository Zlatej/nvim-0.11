return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {},
	config = function(_, opts)
		local npairs = require("nvim-autopairs")
		local rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.setup(opts)

		local is_template = require("util.pair").is_template
		-- local semicolon = require("util.pair").struct_class_semicolon

		npairs.add_rules({
			rule("<", ">"):with_pair(cond.none()):with_move(cond.done()):use_key(">"),
			-- rule("{", "};", { "cpp", "c" }):with_pair(semicolon),
		})

		vim.keymap.set("i", "<", is_template)
	end,
}

-- return {
-- 	"windwp/nvim-autopairs",
-- 	event = "InsertEnter",
-- 	-- Optional dependency
-- 	dependencies = { "hrsh7th/nvim-cmp" },
-- 	config = function()
-- 		require("nvim-autopairs").setup({})
-- 		-- If you want to automatically add `(` after selecting a function or method
-- 		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- 		local cmp = require("cmp")
-- 		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- 	end,
-- }
