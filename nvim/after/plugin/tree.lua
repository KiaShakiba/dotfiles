vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function handle_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"));
end

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 80,
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				width = 100
			}
		}
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = true
		}
	},
	on_attach = handle_attach,
})

vim.keymap.set("n", "<leader>ft", ":NvimTreeOpen<CR>");
