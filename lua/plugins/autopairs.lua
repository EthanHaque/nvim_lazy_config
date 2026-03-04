return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			java = false,
		},
		enable_check_bracket_line = false,
		ignored_next_char = "[%w%.]",
		fast_wrap = {},
		disable_filetype = { "TelescopePrompt", "vim" },
	},
	config = function(_, opts)
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.setup(opts)

		-- Use conds to declaratively define the step-over (quote-like) behavior
		npairs.add_rules({
			Rule("$", "$", "typst"):with_move(cond.after_text("$")),
			Rule("*", "*", "typst"):with_move(cond.after_text("*")),
			Rule("_", "_", "typst"):with_move(cond.after_text("_")),
		})
	end,
}
