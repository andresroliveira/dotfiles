-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- use jk to exit insert mode

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
