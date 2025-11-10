require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
-- vim.opt.mouse=a
-- vim.opt.grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
vim.opt.scrolloff = 3
vim.opt.clipboard = "unnamed"
vim.opt.background = "dark"
vim.opt.laststatus = 2
vim.opt.textwidth = 100
vim.opt.updatetime = 100
-- vim.opt.signcolumn=yes
vim.opt.backupcopy = "no"
vim.opt.sidescrolloff = 3
-- vim.opt.display+=lastline
-- vim.opt.formatoptions=tcrqj " see :h fo-table
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true

vim.opt.foldenable = true
-- vim.opt.foldopen-="block"
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 3

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.completeopt = { "menu", "longest", "preview" }

vim.opt.wildmode = { "longest", "list:longest" }
vim.opt.wildignore:append { ".git/**", "coverage/**", "tmp/**", "**~" }

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.winheight = 3
vim.opt.winwidth = 65
vim.opt.winminheight = 3
vim.opt.winminwidth = 65

vim.lsp.reuse_win = true
