vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


vim.keymap.set("n", "<leader>lf", function ()
    require('lint').try_lint()
end)
