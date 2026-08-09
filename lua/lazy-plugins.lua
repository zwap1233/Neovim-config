-- NOTE: Loads in all lazy plugins
require("lazy").setup({
	require("wouter.plugins.which-key"), -- Show hints for keymaps

	require("wouter.plugins.tokyonight"),

	require("wouter.plugins.git"),
	require("wouter.plugins.ai"),
	require("wouter.plugins.debug"),
	require("wouter.plugins.local-config"),

	require("wouter.plugins.telescope"),

	require("wouter.plugins.lspconfig"),
	require("wouter.plugins.treesitter"),
	-- require("wouter.plugins.conform"),
	require("wouter.plugins.linter"),

	require("wouter.plugins.todo-comments"), -- note and todo comments
	require("wouter.plugins.mini"),

	require("wouter.plugins.neo-tree"), -- file explorer
	require("wouter.plugins.workspaces"), -- workspaces
}, { ---@diagnostic disable-line: missing-fields

	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
