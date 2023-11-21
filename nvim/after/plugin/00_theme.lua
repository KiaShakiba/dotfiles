local monokai = require("monokai")
local palette = monokai.soda

monokai.setup {
	palette,
	custom_hlgroups = {
		GitSignsChange = {
			fg = palette.orange,
			bg = palette.base2
		}
	}
}
