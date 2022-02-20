local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap ',' as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

-- Navigate Tabs
keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- <F1> for <ESC> to prevent unexpected click
keymap("n", "<F1>", "<ESC>", opts)

-- Use CTRL-S for saving
keymap("n", "<C-s>", ":update<CR>", opts)

-- SHIFT-Insert are Paste
keymap("n", "<S-Insert>", '"+gP', opts)

-- Yank from the cursor to the end of the line, to be consistent with C and D.
keymap("n", "Y", "y$", opts)

-- <Space> for page down
keymap("n", "<Space>", "<C-f>", opts)

-- <Down> and <Up> as 'gj' and 'gk'
keymap("n", "<Down>", "gj", opts)
keymap("n", "<Up>", "gk", opts)

-- Code folding options
keymap("n", "z0", ":set foldlevel=0<CR>", opts)
keymap("n", "z1", ":set foldlevel=1<CR>", opts)
keymap("n", "z2", ":set foldlevel=2<CR>", opts)
keymap("n", "z3", ":set foldlevel=3<CR>", opts)
keymap("n", "z4", ":set foldlevel=4<CR>", opts)
keymap("n", "z5", ":set foldlevel=5<CR>", opts)
keymap("n", "z6", ":set foldlevel=6<CR>", opts)

-- "zw" for easier toggle wrap and no wrap
-- keymap("n", "<F2>", ":set wrap!<BAR>set wrap?<CR>", opts)
keymap("n", "zw", ":set wrap!<BAR>set wrap?<CR>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Use CTRL-S for saving
keymap("i", "<C-s>", "<C-O>:update<CR>", opts)

-- Better cursor navigation
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Use CTRL-S for saving
keymap("v", "<C-s>", "<C-C>:update<CR>", opts)

-- backspace in Visual mode deletes selection
keymap("v", "<BS>", "d", opts)

-- SHIFT-Del are Cut
keymap("v", "<S-Del>", '"+x', opts)

-- CTRL-Insert are Copy
keymap("v", "<C-Insert>", '"+y', opts)

-- Command --
keymap("c", "<S-Insert>", '<C-R>+', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

