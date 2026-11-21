vim.pack.add({
	-- Theme
	"https://github.com/ellisonleao/gruvbox.nvim",

	-- Status line
	"https://github.com/nvim-lualine/lualine.nvim",

	-- Language parsers and highling queries
	"https://github.com/nvim-treesitter/nvim-treesitter",

	-- Fuzzy finder
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",

	-- Git change markers and previews
	"https://github.com/lewis6991/gitsigns.nvim",

	-- Language-server installation and configuration
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

-- Use the terminal background.
require("gruvbox").setup({
	transparent_mode = true,
	contrast = "soft",
})
vim.cmd.colorscheme("gruvbox")

-- Match the statusline to the editor theme.
require("lualine").setup({
	options = {
		theme = "gruvbox",
		icons_enabled = false,
		component_separators = "",
		section_separators = "",
	},
})

-- Install frequently used languages.
require("nvim-treesitter").install({
	"c",
	"cpp",
	"css",
	"doxygen",
	"html",
	"javascript",
	"json",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"objdump",
	"python",
})

-- Enable highlighting whenever a language parser is available.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
	callback = function(event)
    	local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)

		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start(event.buf, lang)
		end
	end,
})

require("telescope").setup()

-- Shortcuts for opening Telescope pickers.
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope search keymaps" })

-- Show Git changes beside the code.
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = require("gitsigns")

		-- Preview the change under the cursor, including deleted lines.
		vim.keymap.set("n", "ghp", gs.preview_hunk_inline, { buffer = bufnr, desc = "Preview Git hunk" })
		-- Show the commit responsible for the current line. 
		vim.keymap.set("n", "gb", gs.blame_line, { buffer = bufnr, desc = "Git blame line" })
	end,
})

-- Make Mason-managed tools available to Neovim.
require("mason").setup()

-- Teach LuaLS about Neovim Lua environment.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false,
			},
		},
	},
})

-- Install missing servers and enable them automatically.
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"cssls",
		"html",
		"lua_ls",
		"pyright",
		"ts_ls",
	},
})
