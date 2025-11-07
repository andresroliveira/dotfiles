return {
	{
		"mason-org/mason.nvim",
		config = function()
			local mason = require("mason")
			mason.setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"html",
					"cssls",
					"gopls",
					"ts_ls", -- novo nome do tsserver
					"intelephense",
					"tailwindcss",
					"emmet_language_server",
				},
				-- Deixe true para ligar automaticamente tudo que o Mason instalar.
				-- Você pode filtrar: { exclude = { "rust_analyzer" } } ou { "lua_ls", "pyright" }
				automatic_enable = true,
			})

			-- Exemplo de customização *antes* de habilitar (vale p/ automatic_enable também):
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"yapf",
				"pint",
				"blade-formatter",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
