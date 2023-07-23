vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "EdenEast/nightfox.nvim"
	use "navarasu/onedark.nvim"
	use "tanvirtin/monokai.nvim"

	use "neovim/nvim-lspconfig"

	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	}

	use "ycm-core/YouCompleteMe"

	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
end)
