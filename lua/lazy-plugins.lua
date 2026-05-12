-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added via a link or github org/name. To run setup automatically, use `opts = {}`
	--	{ "NMAC427/guess-indent.nvim", opts = {} },

	-- modular approach: using `require 'path.name'` will
	-- include a plugin definition from file lua/path/name.lua

	require("wouter.plugins.which-key"),

	require("wouter.plugins.git"),

	require("wouter.plugins.ai"),

	require("wouter.plugins.telescope"),

	require("wouter.plugins.lspconfig"),

	require("wouter.plugins.conform"),

	require("wouter.plugins.blink-cmp"),

	require("wouter.plugins.tokyonight"),

	require("wouter.plugins.todo-comments"),

	require("wouter.plugins.mini"),

	require("wouter.plugins.treesitter"),
	--
	require("wouter.plugins.autopairs"),

	require("wouter.plugins.neo-tree"),

	require("wouter.plugins.workspaces"),

	require("wouter.plugins.debug"),

	require("wouter.plugins.snippets"),
	-- NOTE: For more info
	--
	-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- Or use telescope!
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search
}, { ---@diagnostic disable-line: missing-fields
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
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
