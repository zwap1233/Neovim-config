-- setup linting with verilator in for verilog and sytem verilog

---@module 'lazy'
---@type LazySpec
return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			verilog = { "verilator" },
			systemverilog = { "verilator" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
