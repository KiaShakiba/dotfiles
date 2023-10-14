local lualine = require("lualine");

local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	white = "#ffffff",
	yellow = "#ecbe7b",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#ff8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local mode_colors = {
		n = colors.red,
		i = colors.green,
		v = colors.blue,
		[""] = colors.blue,
		V = colors.blue,
		c = colors.magenta,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[""] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		["r?"] = colors.cyan,
		["!"] = colors.red,
		t = colors.red,
	}

local config = {
	options = {
		disabled_filetypes = { "packer", "NvimTree" },

		component_separators = "",
		section_separators = "",

		theme = {
			normal = { c = { fg = colors.fg } },
			inactive = { c = { fg = colors.fg } },
		},
	},

	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,

	has_large_width = function()
		return vim.fn.winwidth(0) > 80
	end,

	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,

	has_lsp = function()
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()

		if next(clients) == nil then
			return false
		end

		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes

			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return true
			end
		end

		return false
	end,
}

local function push_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function push_right(component)
	table.insert(config.sections.lualine_x, component)
end

push_left {
	function()
		return "▊"
	end,
	color = function()
		return { fg = mode_colors[vim.fn.mode()] }
	end,
	padding = { left = 0, right = 1 }
}

push_left {
	"branch",
	icon = " ",
	color = { fg = colors.red, gui = "bold" },
	cond = conditions.has_large_width,
}

push_left {
	"filename",
	cond = conditions.buffer_not_empty,
}

push_left { "location" }

push_left {
	"progress",
	color = { fg = colors.fg }
}

push_left {
	"diagnostics",
	sources = { "nvim_diagnostic" },

	symbols = {
		error = " ",
		warn = " ",
		info = " "
	},

	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},

	cond = conditions.has_large_width,
}

push_left {
	function()
		return "%="
	end,

	cond = conditions.has_large_width,
}

push_left {
	function()
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()

		if next(clients) == nil then
			return ""
		end

		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes

			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end

		return "No active LSP"
	end,

	icon = " LSP:",
	color = { fg = colors.fg, gui = "bold" },
	cond = conditions.has_lsp,
}

push_right {
	"filesize",
	cond = conditions.buffer_not_empty,
}

push_right {
	"o:encoding",
	fmt = string.upper,
	color = { fg = colors.green, gui = "bold" },
	cond = conditions.has_large_width,
}

push_right {
	"fileformat",
	fmt = string.upper,
	icons_enabled = false,
	color = { fg = colors.green, gui = "bold" },
	cond = conditions.has_large_width,
}

push_right {
	"diff",

	symbols = {
		added = " ",
		modified = "󰝤 ",
		removed = " ",
	},

	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},

	cond = conditions.has_large_width,
}

push_right {
	function()
		return "▊"
	end,
	color = function()
		return { fg = mode_colors[vim.fn.mode()] }
	end,
	padding = { left = 1 },
}

lualine.setup(config)
