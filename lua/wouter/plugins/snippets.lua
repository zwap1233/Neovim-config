---@module 'lazy'
---@type LazySpec
return {
	{
		"L3MON4D3/LuaSnip",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		opts = { enable_autosnippets = true },
		keys = {
			{
				"<C-K>",
				function()
					require("luasnip").expand()
				end,
				mode = { "i" },
				desc = "Expand snippet",
			},
			{
				"<C-L>",
				function()
					require("luasnip").jump(1)
				end,
				mode = { "i", "s" },
				desc = "Jump to next snippet",
			},
			{
				"<C-J>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
				desc = "Jump to previous snippet",
			},
		},
	},
	{
		"TwIStOy/luasnip-snippets",
		dependencies = { "L3MON4D3/LuaSnip" },
		event = { "InsertEnter" },
		config = function()
			-- register all snippets into LuaSnip
			require("luasnip-snippets").setup()
		end,
	},
}
