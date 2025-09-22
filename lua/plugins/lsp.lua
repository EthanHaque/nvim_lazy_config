return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local telescope_builtin = require("telescope.builtin")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach = function(client, bufnr)
			-- Displays hover information about the symbol under the cursor
			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP Hover" }
			)

			-- Jump to the definition (using Telescope)
			vim.keymap.set(
				"n",
				"gd",
				telescope_builtin.lsp_definitions,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP Definition" }
			)

			-- Jump to declaration
			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP Declaration" }
			)

			-- Lists all the implementations for the symbol under the cursor (using Telescope)
			vim.keymap.set(
				"n",
				"gi",
				telescope_builtin.lsp_implementations,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP Implementation" }
			)

			-- Jumps to the definition of the type symbol (using Telescope)
			vim.keymap.set(
				"n",
				"go",
				telescope_builtin.lsp_type_definitions,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP Type Definition" }
			)

			-- Lists all the references (using Telescope)
			vim.keymap.set(
				"n",
				"gr",
				telescope_builtin.lsp_references,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP References" }
			)

			-- Displays a function's signature information
			vim.keymap.set(
				"n",
				"gs",
				vim.lsp.buf.signature_help,
				{ noremap = true, silent = true, buffer = bufnr, desc = "Signature Help" }
			)

			-- Renames all references to the symbol under the cursor
			vim.keymap.set(
				"n",
				"<F2>",
				vim.lsp.buf.rename,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP Rename" }
			)

			-- Selects a code action available at the current cursor position
			vim.keymap.set(
				"n",
				"<F4>",
				vim.lsp.buf.code_action,
				{ noremap = true, silent = true, buffer = bufnr, desc = "LSP Code Action" }
			)

			-- Show diagnostics in a floating window
			vim.keymap.set(
				"n",
				"gl",
				vim.diagnostic.open_float,
				{ noremap = true, silent = true, buffer = bufnr, desc = "Show Diagnostics" }
			)

			-- Move to the previous diagnostic
			vim.keymap.set(
				"n",
				"[d",
				vim.diagnostic.goto_prev,
				{ noremap = true, silent = true, buffer = bufnr, desc = "Previous Diagnostic" }
			)

			-- Move to the next diagnostic
			vim.keymap.set(
				"n",
				"]d",
				vim.diagnostic.goto_next,
				{ noremap = true, silent = true, buffer = bufnr, desc = "Next Diagnostic" }
			)

			-- Add folder to workspace
			vim.keymap.set(
				"n",
				"<leader>wa",
				vim.lsp.buf.add_workspace_folder,
				{ noremap = true, silent = true, buffer = bufnr, desc = "Add Workspace Folder" }
			)

			-- Remove folder from workspace
			vim.keymap.set(
				"n",
				"<leader>wr",
				vim.lsp.buf.remove_workspace_folder,
				{ noremap = true, silent = true, buffer = bufnr, desc = "Remove Workspace Folder" }
			)

			-- View workspace folders
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, { noremap = true, silent = true, buffer = bufnr, desc = "List Workspace Folders" })
		end

		mason_lspconfig.setup({})

		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		lspconfig.ruff.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = { command = "clippy" },
				},
			},
		})

		lspconfig.vtsls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			settings = {
				complete_function_calls = true,
				vtsls = {
					enableMoveToFileCodeAction = true,
					autoUseWorkspaceTsdk = true,
					experimental = {
						maxInlayHintLength = 30,
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
				},
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					suggest = {
						completeFunctionCalls = true,
					},
					inlayHints = {
						enumMemberValues = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						parameterNames = { enabled = "literals" },
						parameterTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						variableTypes = { enabled = false },
					},
				},
			},
		})
	end,
}
