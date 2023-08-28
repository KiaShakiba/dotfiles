vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "EdenEast/nightfox.nvim"
	use "navarasu/onedark.nvim"
	use "tanvirtin/monokai.nvim"

	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	}

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},             -- Required
			{"williamboman/mason.nvim"},           -- Optional
			{"williamboman/mason-lspconfig.nvim"}, -- Optional

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},     -- Required
			{"hrsh7th/cmp-nvim-lsp"}, -- Required
			{"L3MON4D3/LuaSnip"},     -- Required
		}
	}
end)
