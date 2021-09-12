vim.g.mapleader = ' '

local map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Telescope
map('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
map('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')

-- Navigation
map("n", ";", "l")
map("n", "l", "k")
map("n", "k", "j")
map("n", "j", "h")

-- Enter
map("", "<CR>", "<Esc>i<CR>")

-- Backspace
map("", "<Backspace>", "<Esc>i<Backspace>")

-- Space
map("", "<Space>", "<Esc>i<Space>")

-- Home - Go To Begin
map("", "<A-Left>", "<Esc>gg")

-- End - Go To End
map("", "<A-Right>", "<Esc>G")

-- Ctrl A - Begin Line
map("", "<C-a>", "<Esc>0i")

-- Ctrl C - Comment
map("", "<C-c>", ":CommentToggle<CR>")

-- Ctrl E - End Line
map("i", "<C-e>", "<Esc>$li")
map("n", "<C-e>", "$li")
map("v", "<C-e>", "$li")

-- Ctrl F - Find
map("i", "<C-f>", "<Esc>/")
map("n", "<C-f>", "/")

-- Ctrl H - Search and Replace
map("i", "<C-h>", "<Esc>:%s/")

-- Ctrl K - Search in files with ag
-- call CreateShortcut("C-k", ":Ack! ", "in", "noTrailingIInInsert")

-- Ctrl L - Delete all lines
map("i", "<C-l>", "ggdG")
map("n", "<C-l>", "ggdG")

-- Ctrl O - Open/Close NerdTree
map("", "<C-o>", ":NvimTreeToggle<CR>")

-- Ctrl Q - Quit
map('', '<C-q>', ':q!<CR>')

-- Ctrl R - Redo
-- map("i", "<C-r>", "C-r")
-- map("n", "<C-r>", "C-r")

-- Ctrl S - Save
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")
map("v", "<C-s>", "<Esc>:w<CR>")

-- Ctrl T - New tab
map("", "<C-t>", ":tabnew<CR>i")

-- Ctrl X - Close current tab
map("", "<C-x>", ":tabclose<CR>")

-- Ctrl Z - Undo
map("i", "<C-z>", "<Esc>ui")
map("n", "<C-z>", "u")

-- Pageup - Move up Line
map("i", "<A-Up>", "<Esc>:m-2<CR>i")
map("n", "<A-Up>", ":m-2<CR>")
map("v", "<A-Up>", ":m'>-2<CR>")

-- Pagedown - Move down Line
map("i", "<A-Down>", "<Esc>:m+<CR>i")
map("n", "<A-Down>", ":m+<CR>")
map("v", "<A-Down>", ":m'>+<CR>")

-- Barbar plugins
-- Alt Left - Previous tab
map('n', '<A-Left>', ':BufferPrevious<CR>')
-- Alt Right - Next tab
map('n', '<A-Right>', ':BufferNext<CR>')
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>')
map('n', '<A->>', ' :BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>')
map('n', '<A-2>', ':BufferGoto 2<CR>')
map('n', '<A-3>', ':BufferGoto 3<CR>')
map('n', '<A-4>', ':BufferGoto 4<CR>')
map('n', '<A-5>', ':BufferGoto 5<CR>')
map('n', '<A-6>', ':BufferGoto 6<CR>')
map('n', '<A-7>', ':BufferGoto 7<CR>')
map('n', '<A-8>', ':BufferGoto 8<CR>')
map('n', '<A-9>', ':BufferGoto 9<CR>')
map('n', '<A-0>', ':BufferLast<CR>')
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
-- map('n', '<C-p>', ':BufferPick<CR>')
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>')
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>')
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>')

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
