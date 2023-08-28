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
	mapping = {
		["<S-j>"] = cmp.mapping.select_next_item(),
		["<S-k>"] = cmp.mapping.select_prev_item(),
		["<S-i>"] = cmp.mapping.confirm({ select = true }),
	}
})

lsp.setup()
