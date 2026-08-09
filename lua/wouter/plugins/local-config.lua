---@module 'lazy'
---@type LazySpec
return {
	"klen/nvim-config-local",
	opts = {
		config_files = { ".nvim.lua" },

		hashfile = vim.fn.stdpath("data") .. "/config-local",

		autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
		commands_create = true, -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalDeny)
		silent = false, -- Disable plugin messages (Config loaded/denied)
		lookup_parents = false, -- Lookup config files in parent directories
	},
}
