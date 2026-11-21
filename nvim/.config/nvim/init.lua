-- Use Space as the leader key.
vim.g.mapleader = " "

-- Disable unused remote-plugins language providers.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Keep undo history between sessions.
vim.opt.undofile = true

-- Share yanks and pastes with the system clipboard.
vim.opt.clipboard:append("unnamedplus")

-- Highlight the current line and (maybe) show relative line numbers.
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Reserve space for signs so the code doesn't shift horizontally.
vim.opt.signcolumn = "yes"

-- Show column guides and briefly jump to matching brackets.
vim.opt.colorcolumn = "80,120"
vim.opt.showmatch = true

-- Keep context around the cursor and display long lines without wrapping.
vim.opt.scrolloff = 10
vim.opt.wrap = false

-- Ignore case in searches unless the pattern contains uppercase letters.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Display tabs at four-column stops, indentation follows that width.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

-- Show trailing spaces while keeping indentation visually off.
vim.opt.list = true
vim.opt.listchars:append({ trail = "·", leadtab = "  " })

-- Tab indents or cycles through completions.
vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	end

	local before_cursor = vim.api.nvim_get_current_line():sub(1, vim.fn.col(".") - 1)
	if before_cursor:match("%S$") and vim.bo.omnifunc ~= "" then
		return "<C-x><C-o>"
	end

	return "<Tab>"
end, { expr = true, desc = "Complete or indent" })

-- Browse files.
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "File explorer" })

-- Navigate and close buffers.
vim.keymap.set("n", "<leader>h", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>l", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>d", vim.cmd.bdelete, { desc = "Delete buffer" })

-- Keep the cursor centered after half-screen scrolling.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep search results centered.
vim.keymap.set("n", "n", "nzz", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search result and center" })

require("plugins")
