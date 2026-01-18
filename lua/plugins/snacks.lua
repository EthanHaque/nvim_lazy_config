return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		gh = { enabled = true },
		image = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				files = {
					hidden = true,
					ignored = true,
					exclude = {
						".git/*",
						"node_modules/*",
						".venv/*",
						"**/__pycache__/*",
						"build/*",
						".DS_Store",
						".rumdl_cache/*",
					},
				},
			},
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
	},
	keys = {
        -- stylua: ignore start
        { "<leader>fd", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Text" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Tags" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },

        { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
        { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
        { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
        { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
		-- stylua: ignore end
	},
}
