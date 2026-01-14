---@type vim.lsp.Config
return {
	cmd = { "java", "-jar", "vespa-language-server.jar" },
	filetypes = { "sd", "profile", "yql" },
	root_markers = {
		".git",
	},
}
