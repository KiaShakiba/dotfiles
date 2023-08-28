local lsp = require("lsp-zero").preset({
	sign_icons = {}
})

require("lsp-zero").extend_cmp()

require("mason-lspconfig").setup {
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"tsserver",
		"eslint",
		"clangd",
		"gopls",
	},
}

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

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
