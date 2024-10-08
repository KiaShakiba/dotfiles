require"nvim-treesitter.configs".setup {
	ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "javascript", "typescript" },

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		disable = { "c", "cpp", "rust" },
		additional_vim_regex_highlighting = false,
	},
}
