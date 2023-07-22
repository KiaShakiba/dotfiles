require("plugins")
require("tree")
require("theme")

vim.opt.number = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.g.rust_recommended_style = false

vim.opt.so = 999
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.wrap = false
vim.opt.mouse = ""

vim.keymap.set("n", "<esc>", ":noh<return><esc>")
