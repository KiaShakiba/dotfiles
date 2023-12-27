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

	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-tree/nvim-web-devicons"},
		}
	}

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

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

	use {
		"j-hui/fidget.nvim",
		tag = "v1.0.0",
		config = function()
			require("fidget").setup {
				progress = {
					display = {
						progress_icon = { pattern = "dots" }
					}
				}
			}
		end,
	}

	use {
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			opt = true
		}
	}

	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}
end)
