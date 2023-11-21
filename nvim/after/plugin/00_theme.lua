local monokai = require("monokai")
local palette = monokai.soda

monokai.setup {
	palette,
	custom_hlgroups = {
		GitSignsAdd = {
			fg = palette.green,
			bg = palette.base2
		},
		GitSignsDelete = {
			fg = palette.red,
			bg = palette.base2
		},
		GitSignsChange = {
			fg = palette.orange,
			bg = palette.base2
		}
	}
}
