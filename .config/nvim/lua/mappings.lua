require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- make Y behave consistently with D and C
map("", "Y", "y$", { noremap = true })
-- edit file in current directory
map("", "<leader>e", ":edit <C-R>=fnameescape(expand('%:h')) . '/'<CR>", { noremap = true })
-- close current buffer smartly
map("", "<leader>d", ":bp<bar>bd#<cr>")

--- normal mode ---

-- use enter in normal mode to insert newline
map("n", "<cr>", "o<Esc>k", { noremap = true })
-- use ,n to hide search results
map("n", "<leader>n", ":nohl<cr>")

--- insert mode ---

-- use C-d as delete in insert mode
map("i", "<c-d>", "<del>")

--- command mode ---

map("c", "%%", "<C-R>=fnameescape(expand('%:h')).'/'<cr>", { noremap = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
