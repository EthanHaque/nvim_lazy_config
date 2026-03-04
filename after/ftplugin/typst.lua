vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.linebreak = true

require("nvim-surround").buffer_setup({
	surrounds = {
		["C"] = {
			add = function()
				local config = require("nvim-surround.config")
				local color = config.get_input("Color: ")
				if color then
					return { { "#text(fill: " .. color .. ")[" }, { "]" } }
				end
			end,
			find = "#text$(fill: .-%)%[.-%]",
			delete = "^(#text%(fill: .-%)%[)().-(%])()$",
		},
	},
})
