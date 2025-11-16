-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

vim.opt.completeopt = { "menu", "longest", "preview" }
vim.opt.wildmode = { "longest", "list:longest" }

vim.keymap.set("i", "<cr>", ':call augment#Accept("\n")<cr>', { noremap = true })
vim.keymap.set("i", "<c-space>", ":call augment#Accept()<cr>", { noremap = true })
