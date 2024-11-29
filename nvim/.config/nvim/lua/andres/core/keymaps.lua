-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines up" })
keymap.set("n", "J", "mzJ`z", { silent = true, desc = "Join lines" })
keymap.set("n", "K", "mzi<CR><ESC>`z", { silent = true, desc = "Split line" })
keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down half page" })
keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up half page" })
keymap.set("n", "n", "nzzzv", { silent = true, desc = "Move to next search result" })
keymap.set("n", "N", "Nzzzv", { silent = true, desc = "Move to previous search result" })

keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true, desc = "Move current line down" })
keymap.set("n", "<M-k>", ":m .-2<CR>==", { silent = true, desc = "Move current line up" })

keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close current buffer" }) -- close current buffer
keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save current buffer" }) -- save current buffer

keymap.set("i", "<C-a>", "<C-o>^", { desc = "Move to beginning of line" })
keymap.set("i", "<C-e>", "<C-o>$", { desc = "Move to end of line" })
