--****************************************************************************** 
-- BASIC.LUA
-- Common setup
--****************************************************************************** 

local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Encoding
o.encoding = 'UTF-8'
o.fileencoding = 'UTF-8'
o.fileencodings = 'UTF-8'

-- Fix backspace indent
o.backspace = 'indent,eol,start'

-- Tabs. May be overriten by autocmd rules
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
bo.smartindent = true
o.smarttab = true
bo.autoindent = true
vim.api.nvim_exec(":silent tab all", true)

-- Enable hidden buffers
o.hidden = true

-- History
o.history = 100

-- Faster refraw
o.ttyfast = true

-- Mouse activated in Normal and Visual Mode
o.mouse = 'nv'

-- Set to auto read when a file is changed from the outside
o.autoread = true
vim.cmd([[
  au FocusGained,BufEnter * checktime
]])

-- Better command-line completion
o.wildmenu = true

-- Searching
o.hlsearch =true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.showmatch = true
o.matchtime = 3

-- Directories for swp files
o.backup = false
bo.swapfile = false
o.wb = false

-- No annoying sound on errors
o.errorbells = false
o.visualbell = false
--o.t_vb=
o.tm = 500

o.updatetime = 1000

-- Prevent lag when hitting escape
o.ttimeoutlen = 0
o.timeoutlen = 1000
vim.cmd([[
  au InsertEnter * set timeout
]])
vim.cmd([[
  au InsertLeave * set notimeout
]])

-- Persistant undo
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
