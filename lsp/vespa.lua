---@type vim.lsp.Config
return {
	cmd = { "vespals" },
	filetypes = { "sd", "profile", "yql" },
	root_markers = {
		".git",
	},
}
