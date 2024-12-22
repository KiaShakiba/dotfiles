require("mason").setup()

local lsp_zero = require("lsp-zero")

local lsp = lsp_zero.preset({
	sign_icons = {}
})

lsp_zero.extend_cmp()

require("mason-lspconfig").setup {
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"ts_ls",
		"eslint",
		"clangd",
		"gopls",
		"pyright",
		"svelte",
	},
}

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.rust_analyzer.setup {
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = false
				}
			}
		}
	}
}

lspconfig.ts_ls.setup({})
lspconfig.eslint.setup({})
lspconfig.clangd.setup({})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.svelte.setup({})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},

	preselect = cmp.PreselectMode.None,

	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
	}
})

lsp.setup()
