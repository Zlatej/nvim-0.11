-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
-- Make line numbers default
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "120"

-- cycle lines
vim.cmd("set whichwrap+=h,l")
vim.cmd("set whichwrap+=<,>,[,]")
vim.o.mouse = "a"

-- Tab
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"javascript",
		"typescript",
		"typescriptreact",
		"javascriptreact",
		"html",
		"css",
		"scss",
		"json",
		"yaml",
	},
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.shiftwidth = 2
	end,
})

vim.o.smartindent = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = false

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 12

-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.diagnostic.config({ virtual_text = true, float = { border = "rounded" } })

-- Add borders to LSP hover (Shift+K) and signature help windows
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "LSP Hover" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, { desc = "Go to next [D]iagnostics message" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = "Go to previous [D]iagnostics message" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("v", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("v", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("v", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("v", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Yank to system clipboard
vim.api.nvim_set_keymap("n", "Y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "Y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "YY", '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "YY", '"+yy', { noremap = true, silent = true })

-- Open main.* file
vim.keymap.set("n", "<leader>m", function()
	local files = vim.fn.glob("main.*", false, true)
	if #files > 0 then
		vim.cmd("e " .. files[1])
	else
		print("No main file found in current directory")
	end
end, { desc = "Open main file in current directory" })

-- Fill struct
vim.keymap.set("n", "<leader>fs", function()
	vim.lsp.buf.code_action({
		filter = function(action)
			return action.title:match("Fill ") or action.title:match("fill ")
		end,
		apply = true,
	})
end, { desc = "Fill struct" })
