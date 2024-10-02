require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!


local o = vim.o
local g = vim.g

o.cursorlineopt ='both' -- to enable cursorline!
o.number = true
o.lnr = true
o.relativenumber = true


-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true


-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = "yes"



-- Prettier
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false
