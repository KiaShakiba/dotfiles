local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
	defaults = {
		file_ignore_patterns = {
			"%.pdf",
			"%.bin",
			"/target/",
			"/node_modules/",
			"/build/",
			"/dist/",
			"/tmux/plugins",
		}
	}
}

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
