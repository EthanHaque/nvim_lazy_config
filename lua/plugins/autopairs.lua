return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true,
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false,   -- don"t check treesitter on java
			},

			-- Don"t add pairs if it already has a close pair in the same line
			enable_check_bracket_line = false,
			-- Don"t add pairs if the next char is alphanumeric
			ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	}
}
