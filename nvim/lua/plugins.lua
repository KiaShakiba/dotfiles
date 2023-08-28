vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "EdenEast/nightfox.nvim"
	use "navarasu/onedark.nvim"
	use "tanvirtin/monokai.nvim"

	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	}

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

	use {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{"neovim/nvim-lspconfig"},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-nvim-lsp"},
			{"L3MON4D3/LuaSnip"},
		}
	}
end)
