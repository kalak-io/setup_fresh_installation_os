--****************************************************************************** 
-- UI.LUA
-- Setup window interface
--****************************************************************************** 

local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.syntax = 'on'
o.ruler = true
o.showcmd = true
wo.number = true
--wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = false
o.linebreak = true
o.tw = 500
--o.shortmess+=I -- No intro when starting Vim
o.virtualedit = 'onemore' -- Allow the cursor to move just past the end of the line
o.showmode = false -- Don't display the current mode
--o.iskeyword+=\- -- Complete words containing a dash

-- Theme
-- Set to use truecolor
o.termguicolors = true
-- Set color theme
o.background = 'dark'
-- vim.cmd('colorscheme nightfox')

o.completeopt = "menuone,noselect"
-- o.scrolloff = 10
-- o.sidescrolloff = 5

-- Folding
o.foldlevel = 99
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
